class Item < ApplicationRecord
  #Associated Models 
  belongs_to :inventory
  belongs_to :category
  belongs_to :order, optional: true
  belongs_to :shopping_cart, optional: true
  has_one :store, through: :inventory

  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user

  has_and_belongs_to_many :lists
  has_and_belongs_to_many :searches

  #Validations
  validates_format_of :sku, :with => /[0-9]{10}/
  validates_uniqueness_of :sku

  # Make items searchable through PGSearch inherited PGSearch model from PG Search gem
  include PgSearch::Model
  pg_search_scope :search_by_all, against: [:name, :description, :manufacturer, :model, :material]
end
