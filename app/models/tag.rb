class Tag < ApplicationRecord
  belongs_to :site, dependent: :destroy
end
