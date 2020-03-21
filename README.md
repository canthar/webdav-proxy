# webdav-proxy
Docker image that acts as WebDAV proxy with CORS, SSL (optional), and HTTP Basic Auth support.

## Configuration

Config everything with environment variables:

- `PROXY_DEST` (mandatory) - host we'd like to proxy to (eg https://example.com/webdav)
- `HTPASSWD_CONTENT` (optional) - setup HTTP Basic Auth of this proxy. Set htpasswd file content here.
- `ALLOW_ORIGIN` (optional) - set allowed origin in CORS. Default is `*`.
- `AUTHORIZATION` (optional) - set proxied host HTTP Basic Auth config. Base64 of user:password string.
- `SERVER_NAME` (optional) - server_name nginx setting
- `CERTIFICATE_LOCATION` and `CERTIFICATE_KEY_LOCATION` - location (inside Docker container) of certificate and private key. 
  Without this settings it's plain HTTP server.
