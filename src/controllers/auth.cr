

require "json"
class Auth < Application
    # ...
  
    post "/login", :user do
      # e.g. render a list of features detected on the photo

    json = JSON.build do |json|
    json.object do
      json.field "username", params["username"]
      json.field "password" ,params["password"]
      end
    end


    render json: auth(json)

    #   auth(ReqData.from_json(request.body.not_nil!))
    end
  
    # POST /my_photos/:id/feature
    post "/register", :msg do
      # add a feature to the photo
      head :ok
    end
  end