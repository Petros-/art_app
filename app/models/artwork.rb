class Artwork < ActiveRecord::Base
  # default_scope { order('rating DESC') } #trying to order by rating
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  #validates_presence_of :name, :category #to ensure that page titles have both of these

  acts_as_taggable
  acts_as_taggable_on :tags, :series

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]
  def slug_candidates
    [
      :title,
      [:title, :date],
      [:title, :date, :genre],
      [:title, :date, :genre, :category],
      [:title, :date, :genre, :category, :medium]
    ]
  end

  def previous
    Artwork.where(["id < ?", id]).last
  end

  def next
    Artwork.where(["id > ?", id]).first
  end

end
