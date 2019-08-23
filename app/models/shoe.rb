class Shoe < ApplicationRecord
  # Direct associations

  has_many   :runs,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
