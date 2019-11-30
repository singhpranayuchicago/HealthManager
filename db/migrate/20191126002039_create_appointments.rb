class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :description
      t.datetime :time_at
      t.integer :user_id
      t.boolean :message_sent
      t.integer :doctor_id

      t.timestamps
    end
  end
end
