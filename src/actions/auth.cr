require "http/client"
require "json"
require "jwt"

def auth(credentials : String)
    response =HTTP::Client.post(DB_URL+"/auth/login", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: credentials)
      # => 200
    code = response.status_code # => "<!doctype html>" 
    res = JSON.parse response.body
        puts  response.status_code
        puts res
    if code  = 200
        payload = { "sid" => response.cookies["sid"].value }
        token = JWT.encode(payload, SECRET, "HS256")
    #tokenjson = {"token" => token }

    return {"token"=> token,"rest"=>res}  
    else
    return {"success"=>false}    
    end
end

def register(credentials : String)
    response =HTTP::Client.post(DB_URL+"auth/signup", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: credentials)
      # => 200
    code = response.status_code # => "<!doctype html>" 
    res = JSON.parse response.body
        puts  response.status_code
        puts res
    if code  = 200
        payload = { "sid" => response.cookies["sid"].value }
        token = JWT.encode(payload, SECRET, "HS256")
    #tokenjson = {"token" => token }

    return {"token"=> token,"rest"=>res}  
    else
    return {"success"=>false}    
    end
end

  