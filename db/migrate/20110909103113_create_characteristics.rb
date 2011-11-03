class CreateCharacteristics < ActiveRecord::Migration
  def self.up
    create_table :characteristics do |t|
    	    t.string :category
    	    t.string :name
    	    t.string :unit
    	    t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :characteristics
  end
end
