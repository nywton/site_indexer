require 'rails_helper'

RSpec.describe "Sites", type: :request do
  describe '#Create site POST /sites' do

    # Params comes from github.com/web_hooks
    let!(:site) do
      {site: {url: 'https://www.limlessons.com'}}
    end

    let!(:invalid_site) do
      {url: 'https://www.limleessons.com'}
    end

    context 'with valid params' do
      it 'should return correct http status' do
        post sites_path, params: site, headers: { 'Accept': 'application/json' }
        expect(response).to have_http_status(:created)
      end
    end


  end
end
