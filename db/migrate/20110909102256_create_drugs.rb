class CreateDrugs < ActiveRecord::Migration
  def self.up
    create_table :drugs do |t|
    	    t.string :name
    	    t.string :category
    	    t.text :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :drugs
  end
end
