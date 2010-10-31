class CreateShares < ActiveRecord::Migration
  def self.up
    create_table :shares do |t|
      t.integer :user_id
      t.integer :offering_id
      t.boolean :deposit_received, :default => false
      t.boolean :paid, :default => false
      t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :shares
  end
end
