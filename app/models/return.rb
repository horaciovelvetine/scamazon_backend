class Return < ApplicationRecord
  belongs_to :user
  belongs_to :status
  belongs_to :order
  belongs_to :item 
  has_one :style

  validates_inclusion_of :cause, in: Return['causes']
  
end
