class CreatePhysicals < ActiveRecord::Migration
  def self.up
    create_table :physicals do |t|
      t.integer :consultation_id
      t.date :date_taken
      t.integer :characteristic_id
      t.string :measure
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :physicals
  end
end
