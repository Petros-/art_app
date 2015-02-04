class AddSeriesAndRegionToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :series, :string
    add_column :artworks, :region, :string
  end
end
