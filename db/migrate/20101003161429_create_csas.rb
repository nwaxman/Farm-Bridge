class CreateCsas < ActiveRecord::Migration
  def self.up
    create_table :csas do |t|
      t.string :name
      t.text :description
      t.integer :manager_id
      t.timestamps
    end
  end

  def self.down
    drop_table :csas
  end
end
