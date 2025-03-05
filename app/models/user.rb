class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLES = ['dealer', 'alcoolo']

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :beers
  has_many :orders

  validates :first_name, :last_name, :role, :birth_date, presence: true
  validates :role, inclusion: { in: ROLES }
end
