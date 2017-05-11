class Offering < ApplicationRecord
  belongs_to :organization
  has_many :offerings_tags
  has_many :tags, through: :offerings_tags

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.search(term)
    tag = Tag.find_by(name: term)
    includes(:tags).where('tags.id' => tag)
  end

end
