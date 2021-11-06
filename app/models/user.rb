class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  #Associations:::
  has_one :store
  has_one :shopping_cart
  has_one :wallet, dependent: :destroy


  has_many :viewed_items
  has_many :reviews, dependent: :destroy
  has_many :reviewed_items, through: :reviews, source: :item
  has_many :orders
  has_many :ordered_items, through: :orders, source: :items
  has_many :lists, dependent: :destroy

  validates_uniqueness_of :email
  validates_presence_of :full_name, :phone, :email


end
