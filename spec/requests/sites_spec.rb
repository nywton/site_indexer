require 'rails_helper'

RSpec.describe "Sites", type: :request do
  describe '#Create site POST /sites' do

    # Params comes from github.com/web_hooks
    let!(:site) do
      # {site: {url: 'https://nywton.herokuapp.com'}}
      {"data": {"type":"sites", "attributes":{"url":"https://nywton.herokuapp.com"}}}
    end

    let!(:invalid_site) do
      {url: 'https://www.limleessons.com'}
    end

    context 'with valid params' do
      it 'should return correct http status' do
        post sites_path, params: site.to_json, headers: { 'Content-Type': 'application/vnd.api+json'}
        expect(response).to have_http_status(:created)
      end

      it 'should return response body' do
        post sites_path, params: site.to_json, headers: { 'Content-Type': 'application/vnd.api+json'}
        expect(response.body).to include('resource', 'id', 'url')
      end
    end


  end
end
