class CreateEthnicities < ActiveRecord::Migration
  def self.up
    create_table :ethnicities do |t|
      t.string :code
      t.string :group_code
      t.string :group_name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :ethnicities
  end
end
