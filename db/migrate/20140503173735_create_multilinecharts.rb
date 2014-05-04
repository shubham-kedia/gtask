class CreateMultilinecharts < ActiveRecord::Migration
	def change
		create_table :multilinecharts do |t|
			t.string :month
			t.float :expenses
			t.timestamps
		end
	end
end
