package = "lua-tunnel-sol"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/vintalie/lua-tunnel-sol.git"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
dependencies = {
   "lua >=5.1",
   "bcrypt >= 2.0"
}
build = {
   type = "builtin",
   modules = {
      main = "main.lua"
   }
}
