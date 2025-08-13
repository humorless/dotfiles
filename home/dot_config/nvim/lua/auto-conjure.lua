-- [nfnl] Compiled from fnl/auto-conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local a = autoload("nfnl.core")
local _local_2_ = autoload("edn")
local decode = _local_2_["decode"]
local function shadow_cljs_content()
  return a.slurp("shadow-cljs.edn")
end
local function build_key(tbl)
  return a.first(a.keys(a.get(tbl, "builds")))
end
local function build_key_content()
  return a.slurp(".build-key.edn")
end
local function shadow_build_id()
  if build_key_content() then
    return build_key_content()
  else
    return build_key(decode(shadow_cljs_content()))
  end
end
return {shadow_build_id = shadow_build_id}
