class Family
  attr_accessor(:name, :phone, :species_pref, :breed_pref)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @species_pref = attributes.fetch(:species_pref)
    @breed_pref = attributes.fetch(:breed_pref)
  end

  def save
    DB.exec("INSERT INTO families (name, phone, species_pref, breed_pref) VALUES ('#{@name}', '#{@phone}', '#{@species_pref}', '#{@breed_pref}');")
  end

  def Family.all
    returned_families = DB.exec("SELECT * FROM families;")
    families = []
    returned_families.each do |family|
      name = family.fetch("name")
      phone = family.fetch("phone")
      species_pref = family.fetch("species_pref")
      breed_pref = family.fetch("breed_pref")
      families.push(Family.new({:name => name, :phone => phone, :species_pref => species_pref, :breed_pref => breed_pref}))
    end
    families
  end

# not comparing ids
  def == (another_family)
    self.name().==(another_family.name()).&(self.phone().==(another_family.phone())).&(self.species_pref().==(another_family.species_pref())).&(self.breed_pref().==(another_family.breed_pref()))
  end
end
