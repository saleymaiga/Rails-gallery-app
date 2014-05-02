class AddPriceColumnToArtists < ActiveRecord::Migration
  def change
  	add_column :artists, :price, :integer
  end
end
