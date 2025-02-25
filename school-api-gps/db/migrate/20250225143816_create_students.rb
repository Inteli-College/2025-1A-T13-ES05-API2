class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :academic_id
      t.string :name
      t.string :email
      t.date :date_of_birth
      t.string :contact_phone

      t.timestamps
    end
  end
end
