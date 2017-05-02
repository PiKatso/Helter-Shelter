class Animal
  attr_accessor(:name, :date_in, :species, :breed, :gender, :age, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @date_in = attributes.fetch(:date_in)
    @species = attributes.fetch(:species)
    @breed = attributes.fetch(:breed)
    @gender = attributes.fetch(:gender)
    @age = attributes.fetch(:age)
    @id = attributes.fetch(:id)
  end
end
