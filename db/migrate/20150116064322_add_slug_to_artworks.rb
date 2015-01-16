class AddSlugToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :slug, :string
    add_index :artworks, :slug
  end
end
