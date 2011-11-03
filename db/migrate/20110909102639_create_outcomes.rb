class CreateOutcomes < ActiveRecord::Migration
  def self.up
    create_table :outcomes do |t|
    	    t.string :category
    	    t.string :details
    	    t.string :present
    	    t.integer :consultation_id
    	    t.integer :result_id
    	    
      t.timestamps
    end
  end

  def self.down
    drop_table :outcomes
  end
end
