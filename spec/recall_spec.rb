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
  it "should load the home page" do
    get '/'
    last_response.should be_ok
  end
      
  it "requires a URL param to do it's job" do
    post '/new'
    last_response.should_not == 200
  end
end

describe 'URL Service' do
  
  describe 'generating a new short URL' do
    describe 'should generate tokens' do
      before :each do
        @original_url = 'http://www.fitmentfreak.com'
        @url = Url.new
      end

      it "should generate a token five characters in length" do
        token = @url.generate_token @original_url
        token.length.should == 5
      end    
    end
    
    before :each do
      @url = Url.new(:url => 'http://www.fitmentfreak.com')
    end
    
    it "accepts a 'URL' param" do
      @url.expanded_url.should == 'http://www.fitmentfreak.com'
    end
    
    it "should generate a new token when saving a URL" do
      @url.save
      @url.token.should == 'a5c2a'
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