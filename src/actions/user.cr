require "http/client"
require "json"

def create(user : JSON::String)
response = HTTP::Client.post DB_URL+"auth/signup"
response.status_code      # => 200
response.body.lines.first # => "<!doctype html>"  
        puts "I create user"
end
def patch(desc : String)
    response = HTTP::Client.patch DB_URL+"/users/:id"
    response.status_code      
    response.body.lines.first    
    puts "I update"
end
def delete(userid : String)
    response = HTTP::Client.delete DB_URL+"/users/:id"
    response.status_code      
    response.body.lines.first 
    puts "I delete user"
end
def get(userId : String) : String
    response = HTTP::Client.get DB_URL+"users/#{userId}"
    response.status_code      
    response.body.lines.first 
end    
def list : String
response = HTTP::Client.get DB_URL+"users"
response.status_code     
response.body.lines.first  
end    