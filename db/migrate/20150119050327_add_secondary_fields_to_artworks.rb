class AddSecondaryFieldsToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :availability, :string
    add_column :artworks, :date, :date
    add_column :artworks, :height, :float
    add_column :artworks, :width, :float
    add_column :artworks, :notes, :text
  end
end
