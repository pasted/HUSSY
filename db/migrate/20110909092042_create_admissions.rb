class CreateAdmissions < ActiveRecord::Migration
  def self.up
    create_table :admissions do |t|
      t.date :date_admitted
      t.date :date_discharged
      t.string :itu_admitted
      t.string :itu_days
      t.date :itu_date
      t.integer :hospital_id
      t.integer :consultation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :admissions
  end
end
