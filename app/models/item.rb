class Item < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :shopping_cart, optional: true
  belongs_to :inventory
  has_one :store, through: :inventory
  
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :searches
  has_and_belongs_to_many :lists

  validates_presence_of :name, :description, :manufacturer, :country_of_origin, :price, :sku
  validates_format_of :sku, :with => /[0-9]{10}/

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

  end

end
