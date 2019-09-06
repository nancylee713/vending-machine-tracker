class Snack < ApplicationRecord
  validates_presence_of :name
  validates :price, presence: true,
            numericality: { greater_than_or_equal_to: 0 }

  has_many :snack_machines
  has_many :machines, through: :snack_machines
end
