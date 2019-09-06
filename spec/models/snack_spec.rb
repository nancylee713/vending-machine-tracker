require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_numericality_of :price }
  end

  describe 'relationships' do
    it { should have_many(:snack_machines) }
    it { should have_many(:machines).through(:snack_machines) }
  end

  describe 'class methods' do
    it "calculates average price of all snacks" do
      snack_1 = Snack.create!(name: "White Castle Burger", price: 3.50)
      snack_2 = Snack.create!(name: "Pop Rocks", price: 1.50)
      snack_3 = Snack.create!(name: "Flaming Hot Cheetos", price: 2.50)

      expect(Snack.average_price).to eq(2.50)
    end
  end
end
