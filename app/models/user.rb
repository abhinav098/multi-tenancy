class User < ApplicationRecord
  after_create :create_tenant
  validates :subdomain, presence:true
  validate :validate_subdomain

  private

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

  def validate_subdomain
    if ["www", "public", "admin"].include?(subdomain)
      errors.add(:subdomain, "'#{subdomain}' not allowed.")
    end
  end
end
