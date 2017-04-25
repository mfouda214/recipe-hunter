require 'httparty'

class Recipe
	include HTTParty

base_uri "http://#{hostport}/api"

  ENV["FOOD2FORK_KEY"] = '89d3361a2062f643348cc208e69d1c94'

  key_value = ENV['FOOD2FORK_KEY']
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'


  #base_uri "http://food2fork.com/api"
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for (keyword)
     get("/search", query: {q: keyword})["recipes"]
  end
end
