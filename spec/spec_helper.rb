require("rspec")
require("pg")
require("animal")
require("family")

DB = PG.connect({:dbname => "helter_shelter_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM animals *;")
    DB.exec("DELETE FROM families *;")
  end
end
