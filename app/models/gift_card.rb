class GiftCard < ApplicationRecord
  belongs_to :user

  validates_presence_of :code, :balance
  validates_format_of :code, :with => /[0-9]{10}/

  def self.balance_calculator
    rand(1.00..81000.00)
  end
  
end
