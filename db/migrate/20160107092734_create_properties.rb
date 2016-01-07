class CreateProperties < ActiveRecord::Migration
	def change
		create_table :properties do |t|
			t.string :description
			t.references :user, index:true

			t.timestamps null:false
		end
	end
end