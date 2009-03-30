require 'rubygems'
require 'sinatra'
require 'rest_client'
require 'json'

configure :test do
  @@db = "http://localhost:5984/eee-test"
  set :views, 'views'
end

configure :development, :production do
  @@db = "http://localhost:5984/eee"
end

get '/recipes/:permalink' do
  data = RestClient.get "#{@@db}/#{params[:permalink]}"
  @recipe = JSON.parse(data)

  haml :recipe
end
