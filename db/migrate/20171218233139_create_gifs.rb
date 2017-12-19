class CreateGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :gifs do |t|
      t.references :category
      t.text :url

      t.timestamps
    end
  end
end
