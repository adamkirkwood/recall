require_relative '../recall.rb'
require_relative '../models/url.rb'
require 'rack/test'
require 'redis'

set :environment, :test

include Rack::Test::Methods

def app
	Sinatra::Application
end

describe 'URL Service' do
  context 'generating a new short URL' do
    context 'should generate tokens' do
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
end