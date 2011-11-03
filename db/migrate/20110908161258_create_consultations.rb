class CreateConsultations < ActiveRecord::Migration
  def self.up
    create_table :consultations do |t|
      t.date :consulted_date
      t.string :current_state
      t.string :traveled_recently
      t.string :notification
      t.date :notification_date
      t.boolean :notification_date_unknown
      t.integer :patient_id
      t.integer :medic_id
      t.integer :admission_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :consultations
  end
end
