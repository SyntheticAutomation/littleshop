class User < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zipcode, :email, :password_digest
  validates_uniqueness_of :email
  has_many :items

  has_secure_password

  def self.merchants
    where(role: 1)
  end

  def active_items
    items.where(status: true)
  end
end
