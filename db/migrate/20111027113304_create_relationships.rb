class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.string :category
      t.integer :consultation_id
      t.integer :contact_id

      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
