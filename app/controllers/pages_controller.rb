class PagesController < ApplicationController
  def home
  	@artworks = Artwork.all
  end

  def about 
	end

end
