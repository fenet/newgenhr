class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
    		 t.string :company_name, null: false, :limit => 30
    		  t.string :position, null: false, :limit => 30
    		   t.string :testimony, null: false, :limit => 300
      t.timestamps
    end
  end
end
