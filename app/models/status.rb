class Status < ApplicationRecord
  has_many :orders
  has_many :returns
end
