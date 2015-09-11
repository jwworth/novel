class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
