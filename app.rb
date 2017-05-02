require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require './lib/animal'
require './lib/family'
require("pg")
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "helter_shelter"})


get('/') do
  erb(:index)
end
