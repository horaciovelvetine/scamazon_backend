class Address < ApplicationRecord
  belongs_to :user, :store, :account, optional: true
end
