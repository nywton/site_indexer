class SiteResource < JSONAPI::Resource
  attributes :url
  has_many :tags
end