class SiteResource < JSONAPI::Resource
  attributes :url
  has_many :tags

  class << self
    def apply_includes(records, directives)
      super.includes(:tags)
    end
  end
end