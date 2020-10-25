     
require 'sinatra'
require 'sinatra/reloader'
require 'cloudinary' # for upload method
require 'pry'

# optional requires for the cl_image_tag method
require "active_support"
require "action_view"
include CloudinaryHelper

# environment variables
# ENV gives you your environment variables - and its a hash
# ENV = {
#   "API_KEY" => "wewoeiruweirueoru"
# }

config = {
  cloud_name: "sei",
  api_key: ENV["CLOUDINARY_KEY"],
  api_secret: ENV["CLOUNDINARY_SECRET"]
}

get '/' do
  erb :index
end

post '/sign_up' do
  result = Cloudinary::Uploader.upload(params["avatar"]["tempfile"], config)

  "image uploaded - check your cloudinary account - use the cl_image_tag method to show images"
end





