class Organization < ApplicationRecord
  has_many :offerings
  has_many :organizations_categories
  has_many :categories, through: :organizations_categories

  scope :by_letter, ->(initial) {where("LOWER(name) LIKE \'#{initial.downcase}%\'").order(:name) }

  scope :by_search, ->(term) {where("LOWER(name) LIKE \'#{term.downcase}%\'").order(:name) }

  validates :name, presence: true

  has_attached_file :avatar,
    styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    },
    :default_url => '/assets/icon-missing.png'

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.search(search)
    where("name LIKE ?", "%#{search.downcase}%")
  end

  def self.filter(filter)
    joins(:categories).where(:categories => {:id => filter})
  end

  def self.search_similar(org)
    if org.categories != []
      joins(:categories).where("category_id = #{org.categories.first.id}")
    end
  end

  def courses
    self.offerings.where("LOWER(format) LIKE?", "%course")
  end

  def workshops
    self.offerings.where("LOWER(format) LIKE?", "workshop")
  end

  def consulting
    self.offerings.where("LOWER(format) LIKE?", "consulting")
  end

end
