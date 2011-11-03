class CreateMedics < ActiveRecord::Migration
  def self.up
    create_table :medics do |t|
    	    t.string :name
    	    t.string :position
    	    t.string :telephone
    	    t.string :email

    	    t.timestamps
    end
  end

  def self.down
    drop_table :medics
  end
end
