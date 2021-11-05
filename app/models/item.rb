class Item < ApplicationRecord
  #Associated Models 
  belongs_to :inventory
  belongs_to :category
  belongs_to :order, optional: true
  belongs_to :shopping_cart, optional: true
  has_one :store, through: :inventory

  has_many :reviews, dependent: :destroy

  has_many :quesitons, dependent: :destroy
  has_many :answers, through: :quesitons
  has_many :reviewers, through: :reviews, source: :user

  has_and_belongs_to_many :lists
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :searches
  

  #Validations
  validates_format_of :sku, :with => /[0-9]{10}/
  validates_uniqueness_of :sku

  # Make items searchable through PGSearch inherited PGSearch model from PG Search gem
  include PgSearch::Model
  pg_search_scope :search_by_all, against: [:name, :description, :manufacturer, :model, :material]

  def update_rating(item)
    @sum = 0
    item.reviews.each do |review|
      @sum += review.rating
    end
    if item.reviews.length > 0
      item.rating = @sum / item.reviews.length
    else
      item.rating = item.reviews.length
    end
    item.save
  end

end
end
