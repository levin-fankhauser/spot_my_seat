class CreateSeats < ActiveRecord::Migration[7.2]
  def change
    create_table :seats do |t|
      t.string :train, null: false
      t.integer :wagons, default: 8, null: false
      t.integer :current_wagon, null: false
      t.integer :seat_number, null: false
      t.integer :floor, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
