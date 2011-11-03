class CreateConditions < ActiveRecord::Migration
  def self.up
    create_table :conditions do |t|
      t.string :present
      t.string :category
      t.date :onset_date
      t.integer :conditionable_id
      t.string :conditionable_type
      t.integer :classification_id
      t.string :comment
      
      t.timestamps
    end
  end

  def self.down
    drop_table :conditions
  end
end
