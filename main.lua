-- Obtém a tabela com todos os cabeçalhos da requisição
local headers = ngx.req.get_headers()
-- Acessa o cabeçalho "Origin" especificamente
local origin = headers["Origin"]

if origin then
    -- A variável 'origin' contém o valor do cabeçalho, ex: "https://www.exemplo.com"
    ngx.say("A origem da requisição é: " .. origin)
else
    ngx.say("Cabeçalho 'Origin' não encontrado.")
end