class Entity < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :group, dependent: :destroy

  validates :name, :amount, presence: true
end
