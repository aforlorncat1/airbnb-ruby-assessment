require 'bcrypt'

class User < ActiveRecord::Base
	attr_accessor :password
	include BCrypt
	has_many :bookings, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :properties, dependent: :destroy
	before_create :encrypt_password

	#runs the Bcrypt encryption method on the user defined password and saves it into the database under that particular user
	def encrypt_password
		self.encrypted_password = Password.create(self.password)
	end
	#generates a BCrypt object of the password saved in the database which is currently a string and compares it to the password it was passed to 
	def self_authenticate(password)
		BCrypt::Password.new(self.encrypted_password)==password
	end
end
