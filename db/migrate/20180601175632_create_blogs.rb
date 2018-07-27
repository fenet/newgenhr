class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.references :admin, index: true, foreign_key: true
      t.string :blog_photo
      t.string :blog,  null: false
      t.timestamps
    end
  end
end
