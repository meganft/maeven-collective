class Offering < ApplicationRecord
  belongs_to :organization
  has_many :offerings_tags, :dependent => :nullify
  has_many :tags, through: :offerings_tags, :dependent => :nullify

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200',
    medium: '300x300>'
  }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.search(term)
    tag = Tag.find_by(name: term)
    includes(:tags).where('tags.id' => tag) if tag != nil
  end

  def self.search_format(term)
    d = where("format LIKE ?", "#{term.downcase}" )
    c =  where("format LIKE ?", "#{term.capitalize}")
    d+c
  end

end
