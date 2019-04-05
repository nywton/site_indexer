class SitesController < ApplicationController

  # POST /sites
  def create
    @site = Sites::CreateService.call(params[:data][:attributes][:url])
    if @site.id.nil?
      render json: @site.errors, status: :unprocessable_entity
    else
      render json: JSONAPI::ResourceOperationResult.new(:created, @site), status: :created
    end
  end

  # PATCH/PUT /sites/1
  def update
    if @site.update(site_params)
      render json: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def site_params
      params.require(:site).permit(:url)
    end
end
