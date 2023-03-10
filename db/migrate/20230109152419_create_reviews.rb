class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :title
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
