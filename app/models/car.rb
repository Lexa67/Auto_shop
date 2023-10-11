class Car < ApplicationRecord
  belongs_to :auto
  belongs_to :user

  has_rich_text :description

  validates :model, presence: true
  validates :year, presence: true
  validates :color, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
