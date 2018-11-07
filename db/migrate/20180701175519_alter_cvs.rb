class AlterCvs < ActiveRecord::Migration[5.0]
   
  def up
    add_column("cvs", "phone_number", :string, after: :upload_cv)
    add_column("cvs", "email", :string, after: :phone_number)
    add_column("cvs", "address", :string, after: :email)
  end

  def down
  	remove_column("cvs", "address")
  	remove_column("cvs", "email")
  	remove_column("cvs", "address")
  end

end
