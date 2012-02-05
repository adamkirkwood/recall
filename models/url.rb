require 'digest/sha1'
require 'redis'

class Url  
  attr_reader :token, :url
  
  TOKEN_LENGTH = 0..4
  TOKEN_KEY = "url"
  
  def initialize(params = {})
    @url = params[:url] if params[:url]
    @token = params[:token] if params[:token]
  end
  
  def generate_token(url)
    hash = Digest::SHA1.hexdigest url
    token = hash[TOKEN_LENGTH]
  end
  
  def expanded_url
    @url
  end
  
  def save
    if @url && !@token
      redis = Redis.new
      
      @token = generate_token(@url)
      
      redis.setnx self.class.token_key(@token), @url
    end
  end
  
  def self.token_key(token)
    "#{TOKEN_KEY}:#{token}"
  end
  
  def self.find_by_token(token)
    redis = Redis.new    
    redis.get token_key(token)
  end
end