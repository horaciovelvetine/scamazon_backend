class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  #Associations:::
  has_one :store, :shopping_cart, :wallet

  has_many :addresses, :viewed_items, :reviews, :orders, :lists, :returns

  has_many :reviewed_items, through: :reviews, source: :item
  has_many :ordered_items, through: :orders, source: :items

  validates_uniqueness_of :email
  # validates_presence_of :full_name, :phone, :email

end
