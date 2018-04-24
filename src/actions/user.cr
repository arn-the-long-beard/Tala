require "http/client"
require "json"

def create(user : JSON::String)
response = HTTP::Client.post "http://localhost:8529/_db/Tala/Tala/auth/signup"
response.status_code      # => 200
response.body.lines.first # => "<!doctype html>"  
        puts "I create user"
end
def patch(desc : String)
    response = HTTP::Client.patch "http://localhost:8529/_db/Tala/Tala/users/:id"
    response.status_code      
    response.body.lines.first    
    puts "I update"
end
def delete(userid : String)
    response = HTTP::Client.delete "http://localhost:8529/_db/Tala/Tala/users/:id"
    response.status_code      
    response.body.lines.first 
    puts "I delete user"
end
def get(userId : String) : String
    response = HTTP::Client.get "http://localhost:8529/_db/Tala/Tala/users/#{userId}"
    response.status_code      
    response.body.lines.first 
end    
def list : String
response = HTTP::Client.get "http://localhost:8529/_db/Tala/Tala/users"
response.status_code     
response.body.lines.first  
end    