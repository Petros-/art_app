class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :create, :update, :destroy, :admin]

  # GET /artworks
  # GET /artworks.json
  def index
    if params[:tag] 
      @artworks = Artwork.tagged_with(params[:tag])
    elsif params[:series]
      @artworks = Artwork.tagged_with(params[:series])
    else
      @artworks = Artwork.all
    end
  end

  def tagged
      @artworks = Artwork.tagged_with(params[:tag])
  end

  def series
      @artworks = Artwork.tagged_with(params[:series]) 
  end

  def admin
    @artworks = Artwork.all
  end

  def sold
    @artworks = Artwork.where(availability: 'Private collection')
    render :index
  end

  def unsold
    @artworks = Artwork.where(availability: 'Available for purchase')
    render :index
  end

  def landscape
    @artworks = Artwork.where(genre: 'Landscape')
    render :index
  end

  def stilllife
    @artworks = Artwork.where(genre: 'Still life')
    render :index
  end

  def figure
    @artworks = Artwork.where(genre: 'Figure')
    render :index
  end

  def interior
    @artworks = Artwork.where(genre: 'Interior')
    render :index
  end

  def oil
    @artworks = Artwork.where(medium: ['Oil on paper', 'Oil on canvas', 'Oil on canvas mounted on panel', 'Oil pastel'])
    render :index
  end

  def watercolor
    @artworks = Artwork.where(medium: 'Watercolor')
    render :index
  end

  def inkwash
    @artworks = Artwork.where(medium: 'Ink wash')
    render :index
  end

  def charcoal
    @artworks = Artwork.where(medium: 'Charcoal')
    render :index
  end

  def graphite
    @artworks = Artwork.where(medium: 'Graphite')
    render :index
  end

  def paintings
    @artworks = Artwork.where(category: 'Painting')
    render :index
  end

  def drawings
    @artworks = Artwork.where(category: 'Drawing')
    render :index
  end

  def sculpture
    @artworks = Artwork.where(category: 'Sculpture')
    render :index
  end

  # GET /artworks/1
  # GET /artworks/1.json
  def show
    @artwork = Artwork.friendly.find(params[:id])
    # if request.path != artwork_path(@artwork)
    #   redirect_to @artwork, status: :moved_permanently
    # end
  end

  # GET /artworks/new
  def new
    @artwork = Artwork.new
  end

  # GET /artworks/1/edit
  def edit
  end

  # POST /artworks
  # POST /artworks.json
  def create
    @artwork = Artwork.new( artwork_params )

    respond_to do |format|
      if @artwork.save
        format.html { redirect_to @artwork, notice: 'Artwork was successfully created.' }
        format.json { render :show, status: :created, location: @artwork }
      else
        format.html { render :new }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artworks/1
  # PATCH/PUT /artworks/1.json
  def update
    respond_to do |format|
      if @artwork.update(artwork_params)
        format.html { redirect_to @artwork, notice: 'Artwork was successfully updated.' }
        format.json { render :show, status: :ok, location: @artwork }
      else
        format.html { render :edit }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artworks/1
  # DELETE /artworks/1.json
  def destroy
    @artwork.destroy
    respond_to do |format|
      format.html { redirect_to @artwork, notice: 'Artwork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artwork_params
      params.require(:artwork).permit(:title, :category, :image, :genre, :medium, :slug, :availability, :date, :height, :width, :rating, :tag_list, :tag, :region, :series_list, :series)
    end
end
