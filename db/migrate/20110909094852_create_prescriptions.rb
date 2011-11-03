class CreatePrescriptions < ActiveRecord::Migration
  def self.up
    create_table :prescriptions do |t|
      t.integer :patient_id
      t.integer :drug_id
      t.string :prescribed
      t.date :prescribed_date
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :prescriptions
  end
end
