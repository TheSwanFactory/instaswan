class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :name
      t.string :base_url
      t.string :filter
      t.string :final_url

      t.timestamps
    end
  end
end
