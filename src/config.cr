# Application dependencies
require "action-controller"
require "active-model"

# Application code
require "./controllers/application"
require "./actions/*"
require "./controllers/*"
require "./models/*"

# Server required after application controllers
require "action-controller/server"

# Add handlers that should run before your application
ActionController::Server.before(
  HTTP::LogHandler.new(STDOUT),
  HTTP::ErrorHandler.new(true),
  HTTP::ErrorHandler.new(ENV["SG_ENV"]? != "production"),
  HTTP::CompressHandler.new
)

# Optional support for serving of static assests
static_file_path = ENV["PUBLIC_WWW_PATH"]? || "./www"
if File.directory?(static_file_path)
  # Optionally add additional mime types
  ActionController::FileHandler::MIME_TYPES[".yaml"] = "text/yaml"

  # Check for files if no paths matched in your application
  ActionController::Server.before(
    ActionController::FileHandler.new(static_file_path, directory_listing: false)
  )
end

# Configure session cookies
# NOTE:: Change these from defaults
ActionController::Session.configure do
  settings.key = ENV["COOKIE_SESSION_KEY"]? || "_tala_"
  settings.secret = ENV["COOKIE_SESSION_SECRET"]? || "dsajkdasldjsjla23oik130238132132190dk389183m0kd8k21kldka"
end

APP_NAME = "Tala"
VERSION  = "1.0.0"