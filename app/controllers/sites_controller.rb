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

  def show
    params[:include] = "tags" if params[:include].nil?
    super
  end

end
