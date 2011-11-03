class CreateAssays < ActiveRecord::Migration
  def self.up
    create_table :assays do |t|
      t.string :category
      t.string :name
      t.string :description
      t.string :unit
      t.timestamps
    end
  end

  def self.down
    drop_table :assays
  end
end
