class Organization < ApplicationRecord
  has_many :offerings

  validates :name, presence: true

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.search(search)
    where("name LIKE ?", "%#{search.downcase}%")
  end

end
