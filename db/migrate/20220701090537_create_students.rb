class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.references :user, null: false, foreign_key: true
      t.date :year, null: false
      t.integer :semester, null: false

      t.timestamps
    end
  end
end
