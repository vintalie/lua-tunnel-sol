-- atribuindo o lua rocks

-- importante, referenciar os pacotes tais como os incas e os astecas

package.cpath = "/etc/nginx/lua-tunnel-sol/lua_modules/lib64/lua/5.4/?.so;./deps/?.so;" .. package.cpath

local bcrypt = require('bcrypt')

local password = "123"
local hashed = bcrypt.digest(password, 10)
--testando o lua rocks com o openresty
ngx.header.content_type = "text/plain"
ngx.say("Hello World \n" .. hashed)