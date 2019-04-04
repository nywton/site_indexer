class SiteResource < JSONAPI::Resource
  attributes :id, :url
  has_many :tags
end