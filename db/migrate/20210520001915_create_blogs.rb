class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :subtitle
      t.string :hero_image
      t.string :status
      t.string :publish_date
      t.integer :user_id

      t.timestamps
    end
  end
end
