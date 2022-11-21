class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true

end
