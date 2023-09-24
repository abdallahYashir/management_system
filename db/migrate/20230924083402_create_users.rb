class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.boolean :admin
      t.boolean :active

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
