class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :current_state
      t.string :encrypted_nhs_number
      t.string :encrypted_initials
      t.string :encrypted_postcode
      t.string :encrypted_town_of_residence
      t.string :encrypted_sex
      t.string :encrypted_year_of_birth
      t.string :encrypted_mortality
      t.string :encrypted_date_of_death
      t.string :encrypted_cause_of_death     
      t.boolean :dod_unknown
      t.integer :ethnicity_id
      t.string :encrypted_ethnicity_other
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
