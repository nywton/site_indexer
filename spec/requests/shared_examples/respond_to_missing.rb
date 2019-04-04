RSpec.shared_examples 'respond to missing' do |url|
  before do
    get url
  end

  it 'responds with 404' do
    expect(response.status).to eq 404
  end

  it 'responds with error' do
    expect(response.body).to include("Record Not Found")
  end
end