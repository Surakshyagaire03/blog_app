class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable, :recoverable, :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable, :validatable

  # Roles enum
  enum :role, { reader: 0, author: 1, admin: 2 }


  # Associations
  has_many :posts

  # Validations (optional but recommended)
  validates :first_name, presence: true
  validates :last_name, presence: true
end


