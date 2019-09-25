backend "consul" {
  	address = "consul1:8500"
  	advertise_addr = "http://consul1:8300"
  	scheme = "http"
}
listener "tcp" {
    address = "vault1:8200"
    #tls_cert_file = "/config/server.crt"
    #tls_key_file = "/config/server.key"
    tls_disable = 1
}
disable_mlock = true
