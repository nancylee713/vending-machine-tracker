require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do
  before :each do
    @owner = Owner.create!(name: "Sam's Snacks")
    @dons  = @owner.machines.create!(location: "Don's Mixed Drinks")
    @turing = @owner.machines.create!(location: "Turing Basement")

    @snack_1 = Snack.create(name: "Pop Rocks", price: 1.50)
    @snack_2 = Snack.create(name: "Flaming Hot Cheetos", price: 2.50)
    @snack_3 = Snack.create!(name: "White Castle Burger", price: 3.50)

    @snack_1.machines << @dons
    @snack_1.machines << @turing

    @dons.snacks << @snack_1
    @dons.snacks << @snack_2
    @dons.snacks << @snack_3

    @turing.snacks << @snack_1
    @turing.snacks << @snack_2
  end

  scenario 'they see the snack detailed info' do
    visit snack_path(@snack_1)

    expect(page).to have_content(@snack_1.name)
    expect(page).to have_content("$#{@snack_1.price}")

    # within "#machine-id-#{@dons.id}" do
      expect(page).to have_content(@dons.location)
      expect(page).to have_content("#{@dons.count_snacks} kinds of snacks")
      expect(page).to have_content("average price of #{@dons.snacks.average_price}")
    # end

    # within "#machine-id-#{@turing.id}" do
      expect(page).to have_content(@turing.location)
      expect(page).to have_content("#{@turing.count_snacks} kinds of snacks")
      expect(page).to have_content("average price of #{@turing.snacks.average_price}")
    # end
  end
end
