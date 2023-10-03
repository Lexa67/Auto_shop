class Auto < ApplicationRecord
  has_many :cars, dependent: :destroy

  validates :brand, presence: true
end
