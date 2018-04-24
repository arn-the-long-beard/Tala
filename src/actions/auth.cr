require "http/client"
require "json"

def auth(credentials : String)
    response =HTTP::Client.post("http://localhost:8529/_db/Tala/Tala/auth/login", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: credentials)
      # => 200
    response.body.lines # => "<!doctype html>"  
        puts  response.status_code  
        puts response.cookies.to_h
    return response.cookies["sid"].value    
end
  