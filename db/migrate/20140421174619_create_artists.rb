class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.text :bio
      t.string :location
      t.string :title

      t.timestamps
    end
  end
end
