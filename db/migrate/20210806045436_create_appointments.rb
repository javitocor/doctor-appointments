class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :subject
      t.datetime :start_at
      t.datetime :end_at
      t.references :doctor_user, null: false
      t.references :patient_user, null: false

      t.timestamps
    end
    add_foreign_key :appointments, :users, column: :doctor_user_id
    add_foreign_key :appointments, :users, column: :patient_user_id
  end
end
