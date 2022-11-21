class User < ApplicationRecord

  MAX_LENGTH = 35
  MIN_LENGTH = 1
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: MAX_LENGTH }
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: MAX_LENGTH },
    format: { with: VALID_EMAIL_REGEX }
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

  private

  def to_lowercase
    email.downcase!
  end

end
