require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it { should have_many(:snack_machines) }
    it { should have_many(:snacks).through(:snack_machines) }
  end

  describe 'instance methods' do
    it "counts number of distinct snack items" do
      owner = Owner.create!(name: "Jen")
      machine_1 = owner.machines.create!(location: "Don's Mixed Drinks")
      snack_1 = machine_1.snacks.create!(name: "White Castle Burger", price: 3.50)
      snack_2 = machine_1.snacks.create!(name: "White Castle Burger", price: 3.50)
      snack_3 = machine_1.snacks.create!(name: "Pop Rocks", price: 1.50)
      snack_4 = machine_1.snacks.create!(name: "Flaming Hot Cheetos", price: 2.50)

      expect(machine_1.count_snacks).to eq(3)
    end
  end
end
