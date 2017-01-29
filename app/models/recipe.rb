require 'httparty'
require 'pp'
class Recipe
ENV["FOOD2FORK_KEY"] = "44046cdaaa6c1de562ee8e99ffe04eb2"

base_uri 'http://food2fork.com/api'
default_params key: ENV["FOOD2FORK_KEY"]
format :json

def self.for term
	get("/search", query: {q: term})["recipes"]
    end
end

query = Recipe.default_params.merge({"q" => "chocolate"})
p query