require_relative '../recall.rb'
require 'rack/test'

include Rack::Test::Methods

set :environment, :test

def app
	Sinatra::Application
end

describe 'Recall Service' do
  it "should load the home page" do
    get '/'
    last_response.should be_ok
  end
end