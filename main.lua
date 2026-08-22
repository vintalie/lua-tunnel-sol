-- atribuindo o lua rocks

local v = _VERSION:sub(5,8)
package.cpath = "./lua_modules/lib64/lua/"..v.."?.so;./deps/?.so;" .. package.cpath

local bcrypt = require('bcrypt')

local password = "123"
local hashed = bcrypt.digest(password, 10)

ngx.header.content_type = "text/plain"
ngx.say("Hello World \n" .. hashed)