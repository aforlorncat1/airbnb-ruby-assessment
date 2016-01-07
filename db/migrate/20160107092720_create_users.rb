class CreateUsers < ActiveRecord::Migration
	attr_accessor :encrypted_password
	def change
		create_table :users do |t|
			t.string :email
			t.string :encrypted_password

			t.timestamps null:false
		end
	end
end
