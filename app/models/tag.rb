class Tag < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :list, optional: true
end
