require "spec_helper"

describe(Animal) do
  describe('.all') do
    it("is empty at first") do
      expect(Animal.all()).to(eq([]))
    end
  end

  describe("#initialize") do
    it("lets you read the description out") do
      test_animal = Animal.new({:name => "Sparky", :date_in => "2017-05-02", :species => 'dog', :breed => 'dalmatian', :gender => 'male', :age => "3", :id => 1})
      expect(test_animal.name()).to(eq("Sparky"))
    end
  end

  # describe("#initialize") do
  #   it("lets you read the due date out") do
  #   test_animal = Animal.new({:name => "Sparky", :date_in => "2017-05-02", :species => 'dog', :breed => 'dalmatian', :gender => 'male', :age => "3", :id => 1})
  #     expect(test_animal.date_in).to(eq("2017-05-02"))
  #   end
  # end
  #
  # describe("#list_id") do
  #   it("lets you read the list ID out") do
  #     test_animal = Animal.new({:description => "learn SQL", :due_date => "2017-05-02", :list_id => 1})
  #     expect(test_animal.list_id).to(eq(1))
  #   end
  # end
  #
  # describe(".order_task") do
  #   it('orders tasks by due date') do
  #     test_animal1 = Animal.new({:description => "learn SQL", :due_date => "2017-05-03 00:00:00", :list_id => 1})
  #     test_animal2 = Animal.new({:description => "learn SQL", :due_date => "2017-05-02 00:00:00", :list_id => 1})
  #     test_animal1.save
  #     test_animal2.save
  #     expect(Animal.order_task[0]).to(eq(test_animal2))
  #   end
  # end
  #
  #
  # describe("#==") do
  #   it("is the same task if it has the same description") do
  #     task1 = Animal.new({:description => "learn SQL", :due_date => "2017-05-02", :list_id => 1})
  #     task2 = Animal.new({:description => "learn SQL", :due_date => "2017-05-02", :list_id => 1})
  #
  #     expect(task1).to(eq(task2))
  #   end
  # end
  #
  #
  describe("#save") do
    it("adds a animal to the array of saved animals") do
      test_animal = Animal.new({:name => "Sparky", :date_in => "2017-05-02", :species => 'dog', :breed => 'dalmatian', :gender => 'male', :age => "3", :id => 1})
      test_animal.save()
      expect(Animal.all[0].id).to(eq(1))
    end
  end
end
