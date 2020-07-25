class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Gravtastic
  gravtastic
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trainings,  dependent: :destroy
  has_many :partners, :through => :trainings

  

  

 
  
end