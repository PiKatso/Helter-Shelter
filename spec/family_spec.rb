require "spec_helper"

describe(Family) do
  describe('.all') do
    it("is empty at first") do
      expect(Family.all()).to(eq([]))
    end
  end

  describe("#initialize") do
    it("lets you read the description out") do
      test_family = Family.new({:name => "Joneses", :phone => "5035551234", :species_pref => 'dog', :breed_pref => 'dalmatian', :id => 1})
      expect(test_family.name()).to(eq("Joneses"))
    end
  end

  describe("#initialize") do
    it("lets you read the due date out") do
    test_family = Family.new({:name => "Joneses", :phone => "5035551234", :species_pref => 'dog', :breed_pref => 'dalmatian', :id => 1})
      expect(test_family.phone).to(eq("5035551234"))
    end
  end

  describe(".find") do
    it('returns family by id') do
      test_family = Family.new({:name => "Joneses", :phone => "5035551234", :species_pref => 'dog', :breed_pref => 'dalmatian', :id => 1})
      test_family.save()
      test_family2 = Family.new({:name => "Grady", :phone => "5035751230", :species_pref => 'cat', :breed_pref => 'dashund', :id => 2})
      test_family2.save()
      expect(Family.find(test_family.id)).to(include(test_family))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      family1 = Family.new({:name => "Joneses", :phone => "5035551234", :species_pref => 'dog', :breed_pref => 'dalmatian', :id => 1})
      family2 = Family.new({:name => "Joneses", :phone => "5035551234", :species_pref => 'dog', :breed_pref => 'dalmatian', :id => 1})
      expect(family1).to(eq(family2))
    end
  end

  describe("#save") do
    it("adds a family to the array of saved animals") do
      test_family = Family.new({:name => "Joneses", :phone => "5035551234", :species_pref => 'dog', :breed_pref => 'dalmatian', :id => 1})
      test_family.save()
      expect(Family.all).to(eq([test_family]))
    end
  end
end
