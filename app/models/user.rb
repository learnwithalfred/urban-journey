class User < ApplicationRecord
  MAX_LENGTH = 250
  MIN_LENGTH = 1
  validates :name, presence: true, length: { maximum: MAX_LENGTH }
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: MAX_LENGTH }
  validates :password,
            presence: true,
            confirmation: true,
            length: { minimum: 6 }
  validates :password_confirmation, presence: true, on: :create

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :to_lowercase

  has_many :groups, dependent: :destroy
  has_many :entities, dependent: :destroy

  private

  def to_lowercase
    email.downcase!
  end
end
