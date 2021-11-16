class Status < ApplicationRecord
  has_many :orders, :returns
end
