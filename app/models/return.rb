class Return < ApplicationRecord
  belongs_to :user, :status, :order, :item
  
  has_one :style

  validates_inclusion_of :cause, in: Return['causes']
  
end
