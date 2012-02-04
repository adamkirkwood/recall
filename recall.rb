require 'sinatra'

get '/' do
  'Hello World!'
end

post '/:url' do
  
  if !params[:url]
    status 400
  end
end