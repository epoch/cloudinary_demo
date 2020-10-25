# these 2 needs to be required first
require "active_support"
require "action_view"
     
require 'sinatra'
require 'cloudinary' # for upload method
require 'pry'

# optional requires for the cl_image_tag method
include CloudinaryHelper


config = {
  cloud_name: "sei",
  api_key: ENV["CLOUDINARY_KEY"],
  api_secret: ENV["CLOUNDINARY_SECRET"]
}

get '/' do
  erb :index
end

post '/sign_up' do
  # wrapper method that makes an API request to upload image to the cloud (aws s3)
  result = Cloudinary::Uploader.upload(params["avatar"]["tempfile"], config)

  "image uploaded - check your cloudinary account - use the cl_image_tag method to show images"
end





