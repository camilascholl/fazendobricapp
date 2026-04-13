class Category < ApplicationRecord
  has_many :ads, dependent: :restrict_with_error

  validates :description, presence: true, length: { maximum: 60 }
end
