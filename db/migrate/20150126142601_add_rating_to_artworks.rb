class AddRatingToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :rating, :integer
  end
end
