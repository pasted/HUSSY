class CreateReferrals < ActiveRecord::Migration
  def self.up
    create_table :referrals do |t|
      t.string :referred
      t.date :original_admission_date
      t.string :centre_name
      t.string :consultant_name
      t.integer :consultation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :referrals
  end
end
