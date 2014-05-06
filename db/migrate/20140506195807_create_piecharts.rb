class CreatePiecharts < ActiveRecord::Migration
  def change
    create_table :piecharts do |t|
    	t.string :label
    	t.integer :value
      t.timestamps
    end
  end
end
