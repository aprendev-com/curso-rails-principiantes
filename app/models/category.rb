class Category < ApplicationRecord
  validates :name, presence: true

  has_many :products, dependent: :restrict_with_exception
end
