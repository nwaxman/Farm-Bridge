class CreateOfferings < ActiveRecord::Migration
  def self.up
    create_table :offerings do |t|
      t.integer :csa_id
      t.integer :vendor_id
      t.timestamps
    end
  end

  def self.down
    drop_table :offerings
  end
end
