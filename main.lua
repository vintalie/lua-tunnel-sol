-- atribuindo o lua rocks

local version = _VERSION:sub(5,8)
-- importante, referenciar os pacotes tais como os incas e os astecas

package.cpath = "/etc/nginx/lua-tunnel-sol/lua_modules/lib/lua/"..version.."/?.so;./deps/?.so;" .. package.cpath

ngx.say("Hello World \n")