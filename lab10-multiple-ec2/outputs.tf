output "public_ips" {
  description = "Public IP addresses of all EC2 web servers"

  value = {
    for name, server in module.web_servers :
    name => server.public_ip
  }
}

output "website_urls" {
  description = "Website URLs for all EC2 web servers"

  value = {
    for name, server in module.web_servers :
    name => server.website_url

  }
}
