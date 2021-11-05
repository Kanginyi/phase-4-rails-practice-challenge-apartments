class Apartment < ApplicationRecord
    has_many :leases
    has_many :tenants, through: :leases, source: :tenant

    validates :number, presence: true
end
