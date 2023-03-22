class Tenant < ApplicationRecord
    has_many :apartments
    has_many :leases
    
    validates :age, numericality: {greater_than_or_equal_to: 18}
    validates :name, presence: true
end
