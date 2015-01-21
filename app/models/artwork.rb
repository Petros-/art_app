class Artwork < ActiveRecord::Base
  
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]
  def slug_candidates
    [
      :title,
      [:title, :genre],
      [:title, :genre, :category],
      [:title, :genre, :category, :medium]
    ]
  end

  def previous
    Artwork.where(["id < ?", id]).order('id').last
  end

  def next
    Artwork.where(["id > ?", id]).first
  end

end
