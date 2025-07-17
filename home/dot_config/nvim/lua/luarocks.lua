local function add_luarocks_paths()
  local luarocks_path = "/Users/laurencechen/.luarocks-luajit/share/lua/5.1/?.lua;/Users/laurencechen/.luarocks-luajit/share/lua/5.1/?/init.lua"
  local luarocks_cpath = "/Users/laurencechen/.luarocks-luajit/lib/lua/5.1/?.so"

  package.path = package.path .. ";" .. luarocks_path
  package.cpath = package.cpath .. ";" .. luarocks_cpath
end

return {add_luarocks_paths = add_luarocks_paths}

