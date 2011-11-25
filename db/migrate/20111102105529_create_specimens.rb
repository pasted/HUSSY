class CreateSpecimens < ActiveRecord::Migration
  def self.up
    create_table :specimens do |t|
      t.string :stool_sample_submitted
      t.date :stool_sample_date
      t.string :stool_sample_lab
      t.string :stool_reference
      t.date :stool_reference_date
      t.boolean :stool_reference_date_unknown
      t.string :serum_reference
      t.date :serum_reference_date
      t.boolean :serum_reference_date_unknown
      t.string :organism_identified
      t.string :antibodies_detected
      t.string :organism_name
      t.string :organism_serotype
      t.string :organism_phagetype
      t.string :molis_reference
      t.integer :consultation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :specimens
  end
end
