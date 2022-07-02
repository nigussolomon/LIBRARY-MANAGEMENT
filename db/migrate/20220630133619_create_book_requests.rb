class CreateBookRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :book_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :author, null: false
      t.string :publisher, null: false
      t.date :published_date
      t.string :category
      t.string :isbn
      t.string :status

      t.timestamps
    end
  end
end
