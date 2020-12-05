class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
        t.string :title
        t.integer :rating
        t.text :fave_scene
        t.integer :movie_id
        t.integer :viewer_id

        t.timestamps
    end
  end
end
