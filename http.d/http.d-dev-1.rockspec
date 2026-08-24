package = "http.d"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/vintalie/lua-tunnel-sol.git"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
dependencies = {
   queries = {}
}
build_dependencies = {
   queries = {}
}
build = {
   type = "builtin",
   modules = {
      check_ip = "check_ip.lua",
      check_secret = "check_secret.lua"
   }
}
test_dependencies = {
   queries = {}
}
