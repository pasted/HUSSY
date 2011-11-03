class CreateInvestigations < ActiveRecord::Migration
  def self.up
    create_table :investigations do |t|
      t.integer :consultation_id
      t.integer :assay_id
      t.string :value
      t.date :date_of_test

      t.timestamps
    end
  end

  def self.down
    drop_table :investigations
  end
end
