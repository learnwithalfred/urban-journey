class Group < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :entities, dependent: :destroy

  validates :name, :icon, presence: true

  def total_transaction
    entities.sum(:amount)
  end
end
