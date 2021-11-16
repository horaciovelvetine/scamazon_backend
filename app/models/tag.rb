class Tag < ApplicationRecord
  belongs_to :item, :list, optional: true

end
