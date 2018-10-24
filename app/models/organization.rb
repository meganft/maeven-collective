# == Schema Information
#
# Table name: organizations
#
#  id                  :integer          not null, primary key
#  name                :string
#  website             :string
#  instagram           :string
#  twitter             :string
#  facebook            :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  description         :string
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  history             :string
#  slug                :string
#

class Organization < ApplicationRecord
  has_many :offerings
  has_many :organizations_categories
  has_many :categories, through: :organizations_categories
  # after_save :set_slug


  scope :by_letter, ->(initial) {where("LOWER(name) LIKE \'#{initial.downcase}%\'").order(:name) }

  scope :by_search, ->(term) {where("LOWER(name) LIKE \'#{term.downcase}%\'").order(:name) }

  validates :name, presence: true

  # has_attached_file :avatar,
  #   styles: {
  #     thumb: '100x100>',
  #     square: '200x200#',
  #     medium: '300x300>'
  #   },
  #   :default_url => '/assets/icon-missing.png',
  #   s3_region: ENV["AWS_REGION"]

  has_one_attached :avatar
  
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
    self.offerings.where("LOWER(format) LIKE?", "%course" )
  end

  def workshops
    self.offerings.where("LOWER(format) LIKE?", "workshop")
  end

  def consulting
    self.offerings.where("LOWER(format) LIKE?", "consulting")
  end

  def events
    self.offerings.where("LOWER(format) LIKE?", "%event")
  end

  def conferences
    self.offerings.where("LOWER(format) LIKE?", "%conference")
  end

  def add_slug
    update(slug: to_slug(self.name))
  end

  def to_param
    slug
  end

end
