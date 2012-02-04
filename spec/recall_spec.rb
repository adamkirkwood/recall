require_relative '../recall.rb'
require_relative '../models/url.rb'
require 'rack/test'
require 'redis'

set :environment, :test

include Rack::Test::Methods

def app
	Sinatra::Application
end

describe 'Recall Service' do  
  
  describe 'Routing' do
    it "should load the home page" do
      get '/'
      last_response.should be_ok
    end
      
    it "requires a URL param to do it's job" do
      post '/new'
      last_response.should_not == 200
    end
  end
  
  describe 'Redirection' do
    before :each do
      redis = Redis.new
      redis.set "url:a5c2a", "http://www.fitmentfreak.com"
    end
  
    after :all do
      redis = Redis.new
      redis.flushall
    end
  
    it "should return the original URL given a valid token" do
      get '/a5c2a'
      last_response.should be_redirect
      follow_redirect!
      last_request.url.should == 'http://www.fitmentfreak.com/'
    end
  end  
  
end

