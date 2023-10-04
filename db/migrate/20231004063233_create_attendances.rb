class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :present
      t.date :date

      t.timestamps
    end
  end
end
