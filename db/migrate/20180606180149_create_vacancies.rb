class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
			t.references :admin, index: true, foreign_key: true
    		t.string :vacancy_detail, null: false
		    t.string :vacancy_catagory, null: false
		    t.string :vacancy_location, null: false
		    t.string :vacancy_photo #logo if there are no employer_photos
		    t.timestamps
    end
  end
end
