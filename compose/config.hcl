storage "file" {
  path = "/vault/files"
}

listener "tcp" {
  address     = "0.0.0.0:8200",
  tls_disable = true
}

default_lease_ttl =  "168h"
max_lease_ttl = "720h"
ui = true
