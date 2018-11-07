 class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
 t.string :testimony, null: false
      t.string :testimony_photo, null: false #company's logo or employe's photo
      t.timestamps
    end
  end
end
