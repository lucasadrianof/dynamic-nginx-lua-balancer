local balancer = require "ngx.balancer"
local cjson = require "cjson.safe"

local function isempty(s)
  return s == nil or s == ''
end

local nodes = {
  a = "127.0.0.2",
  b = "127.0.0.3"
}

local body_data = cjson.decode(ngx.ctx.body_data)
local host = "a"

-- Sets the balancer according to the payload
if type(body_data) == "table" and body_data["host"] ~= nil and not isempty(body_data["host"]) then
  host = body_data["host"]
end

local ok, err = balancer.set_current_peer(nodes[host], 8080)

if not ok then
    ngx.log(ngx.ERR, "failed to set the current peer: ", err)
    return ngx.exit(ngx.ERROR)
end
