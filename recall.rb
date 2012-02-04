require 'sinatra'
require 'json'
require './models/url'


get '/' do
  'Hello World!'
end

post '/new' do
  content_type :json

  if !params[:url]
    status 400
    return { :error => " 'url' parameter is missing" }.to_json
  else
    @url = Url.new(:url => params[:url])
    @url.save
    status 200
    return { :token => @url.token, :short_url => "http://fmnt.in/#{@url.token}", :original_url => @url.expanded }.to_json    
  end
end

get '/:token' do  
  if @short_url = Url.find_by_token(params[:token])
    redirect @short_url, 301
  else
    raise Sinatra::NotFound
  end
end