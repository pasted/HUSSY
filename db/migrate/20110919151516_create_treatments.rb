class CreateTreatments < ActiveRecord::Migration
  def self.up
    create_table :treatments do |t|
      t.string :type
      t.string :treated
      t.date :date_start
      t.date :date_end
      t.integer :consultation_id
      t.integer :therapy_id

      t.timestamps
    end
  end

  def self.down
    drop_table :treatments
  end
end
