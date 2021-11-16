class List < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags, :items

  validates :name, presence: true, uniqueness: true
end
