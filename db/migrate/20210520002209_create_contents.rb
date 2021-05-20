class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :type
      t.string :value
      t.string :blog_id

      t.timestamps
    end
  end
end
