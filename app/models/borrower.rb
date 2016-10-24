class Borrower < ActiveRecord::Base
  has_secure_password
  has_many :transactions
  has_many :lenders, through: :transactions
   EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :fname, :lname, :purpose, :description, :aneeded, presence: true
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 8}
end
