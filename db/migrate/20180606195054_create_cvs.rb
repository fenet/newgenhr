class CreateCvs < ActiveRecord::Migration[5.0]
  def change
    create_table :cvs do |t|
 t.string :cv_title, null: false #required
      t.string :job_category, null: false #dropdown #required
      #CV_build
	      #education
	      t.string :institution_name
	      t.string :field_of_study #dropdown
	      t.string :admission_year
	      t.string :graduation_year
	      t.string :degree_level #degree level #required
	      #work_experiance
	      t.string :job_title
	      t.string :company_name
	      t.string :start_date
	      t.string :end_date
	      t.string :type_of_organization

	      t.string :skills
	   	  #CV_upload
	      t.string :upload_cv 
	      
       t.timestamps
    end
  end
end
