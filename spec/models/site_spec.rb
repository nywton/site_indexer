require 'rails_helper'

RSpec.describe Site, type: :model do
  it { should validate_presence_of(:url) }
  it { should have_many(:tags).dependent(:destroy) }
end
