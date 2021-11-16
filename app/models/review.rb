class Review < ApplicationRecord
  belongs_to :user, :item
end
