local typedefs = require "kong.db.schema.typedefs"

return {
  name = "udp-log",
  fields = {
    { config = {
        type = "record",
        fields = {
          { mesh_mode = typedefs.mesh_mode_two_way },
          { host = typedefs.host({ required = true }) },
          { port = typedefs.port({ required = true }) },
          { timeout = { type = "number", default = 10000 }, },
    }, }, },
  },
}
