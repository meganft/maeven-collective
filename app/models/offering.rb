class Offering < ApplicationRecord
  belongs_to :organization
  has_many :offerings_tags, :dependent => :nullify
  has_many :tags, through: :offerings_tags, :dependent => :nullify


  has_attached_file :avatar,
    styles: {
      thumb: '100x100>',
      square: '200x200',
      medium: '300x300>'
    },
    :default_url => '/assets/missing.jpg',
    s3_region: ENV["AWS_REGION"]


  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.search(term)
    tag = Tag.find_by(name: term.downcase && term.capitalize && term.titleize)
    includes(:tags).where('tags.id' => tag) if tag != nil
  end

  def self.search_format(term)
    d = Offering.where("format LIKE ?", "#{term.downcase}")
    c =  Offering.where("format LIKE ?", "#{term.capitalize}")
    t =  Offering.where("format LIKE ?", "#{term.titleize}")
    res = d+c+t
    res.uniq
  end

  def similar
    similar = Offering.search_format(self.format)
    similar.delete(self) if similar.include?(self)
    similar = similar[0..2]
  end

end
