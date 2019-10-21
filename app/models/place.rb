class Place < ApplicationRecord
    belongs_to :user
    validates :name,:address,:description, presence: true, length: {minimum: 3, maximum: 500}
    geocoded_by :address
    after_validation :geocode 
end 

