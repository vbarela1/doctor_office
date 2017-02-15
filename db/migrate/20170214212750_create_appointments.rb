class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor, foreign_key: true
      t.belongs_to :patient, foreign_key: true
      t.string :date
      t.string :time
      t.string :location

      t.timestamps
    end
  end
end
