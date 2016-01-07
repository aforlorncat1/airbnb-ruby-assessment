class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.string :description
			t.references :user, index:true
			t.references :property, index:true

			t.timestamps null:false
		end
	end
end