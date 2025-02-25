class AddDetailsToEnrollments < ActiveRecord::Migration[8.0]
  def change
    add_column :enrollments, :start_date, :date
    add_column :enrollments, :end_date, :date
    add_column :enrollments, :status, :string
  end
end
