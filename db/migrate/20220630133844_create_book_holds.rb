class CreateBookHolds < ActiveRecord::Migration[7.0]
  def change
    create_table :book_holds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :hold_date, null: false
      t.date :request_date, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
