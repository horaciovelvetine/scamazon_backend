class Item < ApplicationRecord
  #Associated Models 
  belongs_to :inventory
  delegate :store, :to => :inventory
  belongs_to :category
  
  
  
  has_many :styles
  has_many :quesitons
  has_many :answers, through: :quesitons
  has_many :viewers, through: :viewed_items, source: :user
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user
  
  has_and_belongs_to_many :lists
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :searches
  has_and_belongs_to_many :shopping_carts
  has_and_belongs_to_many :orders
  

  # Make items searchable through PGSearch inherited PGSearch model from PG Search gem
  include PgSearch::Model
  pg_search_scope :search_by_all, against: [:name, :description, :manufacturer, :model, :material]

  # Updates an items rating based on a simple average of all reviews
  def update_rating
    #checks if there are any reviews and rescues if there are none to check
    if self.reviews.length < 1
      self.rating = self.review.length
      return self
    end

    ratings_sum = 0
    self.reviews.each do |review|
      ratings_sum += review.rating
    end
    self.rating = ratings_sum / self.reviews.length
  end

end
