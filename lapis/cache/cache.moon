config = require("lapis.config").get!

assert_config = (configuration) ->
  if (not config) or (not config.cache) or not (config.cache[configuration])
    error "#{configuration} not configured in cache"
  config.cache[configuration]

assert_engine = (configuration, engine) ->
  unless configuration[engine]
    error "#{engine} not configured in #{configuration}"

load_engine = (cfg) ->
  ng = "lapis.cache.engines." .. cfg.engine
  ok, mod = pcall(require, ng)
  if not ok then
    error "engine #{engine} not found"
  mod\set_config cfg
  mod

return class Cache
  @config: (configuration = "default") =>
    assert_config configuration

  @delete: (key, configuration = "default") =>
    unless key
      error "missing key"
    cfg = @config configuration
    engine = load_engine cfg
    engine\delete(key)

  @read: (key, configuration = "default") =>
    unless key
      error "missing key"
    cfg = @config configuration
    engine = load_engine cfg
    engine\read(key)

  @remember: (key, fn, configuration = "default") =>
    res = @read key, configuration
    fcache = true
    unless res
      res = fn!
      fcache = false
      @write key, res, configuration
    res, fcache

  @write: (key, value, configuration = "default") =>
    unless key
      error "missing key"
    unless value
      error "missing value"
    cfg = @config configuration
    engine = load_engine cfg
    engine\write(key, value)
