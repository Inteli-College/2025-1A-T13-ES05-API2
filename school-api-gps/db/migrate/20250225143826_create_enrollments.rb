class CreateEnrollments < ActiveRecord::Migration[8.0]
  def change
    create_table :enrollments do |t|
      t.references :student, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.string :shift

      t.timestamps
    end
  end
end
