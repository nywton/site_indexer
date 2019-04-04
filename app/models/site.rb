class Site < ApplicationRecord
  validates_presence_of :url
  validates_uniqueness_of :url
  has_many :tags
end
