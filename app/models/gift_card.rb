class GiftCard < ApplicationRecord
  belongs_to :user

  validates_presence_of :code, :balance
  validates_format_of :code, :with => /[0-9]{18}/
end
