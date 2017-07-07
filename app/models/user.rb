class User < ApplicationRecord
  validates :human_name, presence: true, length: { minimum: 4, maximum: 20 }
  validates :doggo_name, presence: true, length: { minimum: 2, maximum: 16 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :howls, dependent: :destroy
  has_many :barkbacks, dependent: :destroy
end