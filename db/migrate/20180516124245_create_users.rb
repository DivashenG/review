class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.date :date_of_birth
      t.string :gender
      t.string :email_address
      t.string :encrypted_password
      t.string :salt

      t.timestamps
    end
  end
end
