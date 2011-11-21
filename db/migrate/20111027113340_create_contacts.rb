class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :gender
      t.string :year_of_birth
      t.string :bloody_diarrhoea
      t.date :onset_bloody_diarrhoea
      t.boolean :onset_bloody_diarrhoea_unknown
      t.string :hus
      t.date :onset_hus
      t.boolean :onset_hus_unknown

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
