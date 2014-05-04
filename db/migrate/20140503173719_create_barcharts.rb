class CreateBarcharts < ActiveRecord::Migration
  def change
    create_table :barcharts do |t|
      t.integer :date ,:limit => 8
      t.float :jodhpur
      t.float :bikaner
      t.float :jaipur
      t.timestamps
    end
  end
end
