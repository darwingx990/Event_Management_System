class CreateAttendees < ActiveRecord::Migration[7.2]
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :email
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
