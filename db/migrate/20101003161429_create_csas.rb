class CreateCsas < ActiveRecord::Migration
  def self.up
    create_table :csas do |t|
      t.string :name, :email, :phone, :city, :state, :neighborhood
      t.text :description
      t.text :agreement
      t.integer :manager_id
      t.timestamps
    end
  end

  def self.down
    drop_table :csas
  end
end
