class User < ApplicationRecord
  	has_many :user_tickets	
	has_many :tickets, :through => :user_tickets
	validates :name, :last_name, :password, presence: true 
	validate :email, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }
	validate :phone, numericality: { only_integer: true }
	validate :phone, length: { in: 9 .. 12 }
	validate :password, length: { in: 8 .. 12 }
	validate :password, format: { with: /\A[a-zA-Z0-9\s]+\z/i, message: "can only contain letters and numbers." }
end
