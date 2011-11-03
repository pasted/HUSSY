class CreateTherapies < ActiveRecord::Migration
  def self.up
    create_table :therapies do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :therapies
  end
end
