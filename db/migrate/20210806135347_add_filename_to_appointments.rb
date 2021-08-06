class AddFilenameToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :user_image, :string
  end
end
