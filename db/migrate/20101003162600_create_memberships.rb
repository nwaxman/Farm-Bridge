class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :csa_id
      t.text :share_notes
      t.boolean :manager
      t.boolean :deposit_received, :default => false
      t.boolean :paid, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :memberships
  end
end
