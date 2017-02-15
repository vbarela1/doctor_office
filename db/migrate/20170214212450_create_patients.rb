class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.belongs_to :doctor, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
