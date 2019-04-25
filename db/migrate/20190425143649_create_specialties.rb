class CreateSpecialties < ActiveRecord::Migration[5.2]
  def change
    add_reference :doctors, :specialty, foreign_key: true
    create_table :specialties do |t|
      t.string :specialty
      t.belongs_to :doctor, index: true
      t.timestamps
    end
  end
end
