class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
    		t.string :user_name,  null: false
    		t.string :email,  null: false
    		t.string :subject,  null: false
    		t.string :message,  null: false
      t.timestamps
    end
  end
end
