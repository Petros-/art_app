class AddPrimaryFieldToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :genre, :string
    add_column :artworks, :category, :string
    add_column :artworks, :medium, :string
  end
end
