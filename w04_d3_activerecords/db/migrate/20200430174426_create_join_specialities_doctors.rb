class CreateJoinSpecialitiesDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :join_speciality_doctors do |t|
      t.belongs_to :speciality
      t.belongs_to :doctor

      t.timestamps
    end
  end 
end
