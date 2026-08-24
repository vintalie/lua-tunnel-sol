-- check_ip.lua com logs
local SECRET = "meu_secret_super_secreto"
local ENDPOINT = "https://odoo.mandingamirim.com.br/update-ip"

local function get_external_ip()
    local services = {"ifconfig.me", "icanhazip.com", "ipinfo.io/ip", "api.ipify.org"}
    for _, svc in ipairs(services) do
        local cmd = "curl -s --connect-timeout 3 --max-time 5 " .. svc .. " 2>/dev/null"
        ngx.log(ngx.ERR, "Tentando: " .. cmd)
        local handle = io.popen(cmd)
        if handle then
            local result = handle:read("*a")
            handle:close()
            if result then
                result = result:gsub("%s+", "")
                if result ~= "" then
                    ngx.log(ngx.ERR, "IP obtido: " .. result)
                    return result
                end
            end
        end
    end
    ngx.log(ngx.ERR, "Falha ao obter IP de todos os serviços")
    return nil
end

local function send_ip(ip)
    local json = '{"secret":"' .. SECRET .. '","ip":"' .. ip .. '"}'
    local cmd = string.format(
        "curl -k -s -X POST -H 'Content-Type: application/json' -d '%s' %s 2>/dev/null",
        json, ENDPOINT
    )
    ngx.log(ngx.ERR, "Enviando: " .. cmd)
    local handle = io.popen(cmd)
    if not handle then
        ngx.log(ngx.ERR, "Falha ao abrir pipe para curl")
        return false, "Falha ao executar curl"
    end
    local response = handle:read("*a")
    handle:close()
    ngx.log(ngx.ERR, "Resposta do servidor: " .. (response or "vazia"))
    if response and response:find('"success":true') then
        return true, response
    else
        return false, "Resposta: " .. (response or "vazia")
    end
end

local ip = get_external_ip()
if not ip then
    ngx.status = ngx.HTTP_SERVICE_UNAVAILABLE
    ngx.say("ERRO: não foi possível obter IP externo")
    return
end

local ok, msg = send_ip(ip)
if ok then
    ngx.say("IP enviado com sucesso: " .. ip)
    ngx.say("Resposta do servidor: " .. msg)
else
    ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
    ngx.say("Falha ao enviar IP: " .. msg)
end
