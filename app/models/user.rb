class User < ApplicationRecord
  # Direct associations

  has_many   :monthly_mileages,
             :dependent => :destroy

  has_many   :weekly_mileages,
             :dependent => :destroy

  has_many   :locations,
             :dependent => :destroy

  has_many   :runs,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
