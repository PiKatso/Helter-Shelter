class Family
  attr_accessor(:name, :phone, :species_pref, :breed_pref, :id)
  @@family_id = nil

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @species_pref = attributes.fetch(:species_pref)
    @breed_pref = attributes.fetch(:breed_pref)
    @id = attributes.fetch(:id)
  end

  def save
    result = DB.exec("INSERT INTO families (name, phone, species_pref, breed_pref) VALUES ('#{@name}', '#{@phone}', '#{@species_pref}', '#{@breed_pref}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def Family.all
    returned_families = DB.exec("SELECT * FROM families;")
    families = []
    returned_families.each do |family|
      name = family.fetch("name")
      phone = family.fetch("phone")
      species_pref = family.fetch("species_pref")
      breed_pref = family.fetch("breed_pref")
      id = family.fetch("id").to_i
      families.push(Family.new({:name => name, :phone => phone, :species_pref => species_pref, :breed_pref => breed_pref, :id => id}))
    end
    families
  end

# not comparing ids
  def == (another_family)
    self.name().==(another_family.name()).&(self.phone().==(another_family.phone())).&(self.species_pref().==(another_family.species_pref())).&(self.breed_pref().==(another_family.breed_pref()))
  end

  def add_animal (animal)
      @animals.push(animal)
  end

  #this searches all instances of family in the database and returns a family in hash form.
  def Family.find (identification)
    matched_family = nil
    returned_families = DB.exec("SELECT * FROM families;")
    returned_families.each() do |family|
      # binding.pry
      id = family.fetch("id").to_i
      if id.to_i == identification.to_i
        matched_family = family
      end
    end
    matched_family
  end

end
