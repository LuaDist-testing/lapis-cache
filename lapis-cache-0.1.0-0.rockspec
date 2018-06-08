-- This file was automatically generated for the LuaDist project.

package = "lapis-cache"
version = "0.1.0-0"

-- LuaDist source
source = {
  tag = "0.1.0-0",
  url = "git://github.com/LuaDist-testing/lapis-cache.git"
}
-- Original source
-- source = {
--   url = "git://github.com/CriztianiX/lapis-cache.git",
--   tag = "0.1.0"
-- }

description = {
  summary = "Cache engines for Lapis Framework",
  homepage = "https://github.com/CriztianiX/lapis-cache",
  maintainer = "Cristian Haunsen <cristianhaunsen@gmail.com>",
  license = "MIT"
}

dependencies = {
  "lua ~> 5.1",
  "lapis",
  "redis-lua"
}

build = {
  type = "builtin",
  modules = {
    ["lapis.cache.cache"] = "lapis/cache/cache.lua",
    ["lapis.cache.engines.engine"] = "lapis/cache/engines/engine.lua",
    ["lapis.cache.engines.redis"] = "lapis/cache/engines/redis.lua",
  }
}