class CreateLittleObject < ActiveRecord::Migration
  def up
    create_table :little_objects do |t|
      t.string :name
      t.string :first_name
      t.string :address
      t.integer :post_code
      t.string :city

      t.timestamps
    end
  end

  def down
    drop_table :little_objects
  end
end
