class CreateTravels < ActiveRecord::Migration
  def self.up
    create_table :travels do |t|
      t.integer :consultation_id
      t.string :visited
      t.date :arrived
      t.date :departed

      t.timestamps
    end
  end

  def self.down
    drop_table :travels
  end
end
