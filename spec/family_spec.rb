require "spec_helper"

describe(Family) do
  describe('.all') do
    it("is empty at first") do
      expect(Family.all()).to(eq([]))
    end
  end

  describe("#initialize") do
    it("lets you read the description out") do
      test_family = Family.new({:name => "Joneses", :phone => "5035551234", :species_pref => 'dog', :breed_pref => 'dalmatian'})
      expect(test_family.name()).to(eq("Joneses"))
    end
  end

  describe("#initialize") do
    it("lets you read the due date out") do
    test_family = Family.new({:name => "Joneses", :phone => "5035551234", :species_pref => 'dog', :breed_pref => 'dalmatian'})
      expect(test_family.phone).to(eq("5035551234"))
    end
  end

  # describe("#list_id") do
  #   it("lets you read the list ID out") do
  #     test_family = Family.new({:description => "learn SQL", :due_date => "2017-05-02", :list_id => 1})
  #     expect(test_family.list_id).to(eq(1))
  #   end
  # end
  #
  # describe(".order_task") do
  #   it('orders tasks by due date') do
  #     test_family1 = Family.new({:description => "learn SQL", :due_date => "2017-05-03 00:00:00", :list_id => 1})
  #     test_family2 = Family.new({:description => "learn SQL", :due_date => "2017-05-02 00:00:00", :list_id => 1})
  #     test_family1.save
  #     test_family2.save
  #     expect(Family.order_task[0]).to(eq(test_family2))
  #   end
  # end
  #
  #
  describe("#==") do
    it("is the same task if it has the same description") do
      family1 = Family.new({:name => "Joneses", :phone => "5035551234", :species_pref => 'dog', :breed_pref => 'dalmatian'})
      family2 = Family.new({:name => "Joneses", :phone => "5035551234", :species_pref => 'dog', :breed_pref => 'dalmatian'})
      expect(family1).to(eq(family2))
    end
  end


  describe("#save") do
    it("adds a family to the array of saved animals") do
      test_family = Family.new({:name => "Joneses", :phone => "5035551234", :species_pref => 'dog', :breed_pref => 'dalmatian'})
      test_family.save()
      expect(Family.all).to(eq([test_family]))
    end
  end
end
