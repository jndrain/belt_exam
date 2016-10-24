class CreateLenders < ActiveRecord::Migration
  def change
    create_table :lenders do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest
      t.integer :balance

      t.timestamps null: false
    end
  end
end
