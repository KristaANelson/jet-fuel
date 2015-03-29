class Api::V1::UrlsController < ApplicationController
  respond_to :json, :xml

  def create
    @url = Url.new(url_params)
    if @url.save
      respond_with @url
    else
      respond with "Error, did not create"
    end
  end

  def show
    respond_with Url.find(params[:id])
  end

  def redirect
    @url = Url.find_by(short_url: params[:short_url])
    @url.up_visit_count
    respond_with @url.full_url
  end

  private

  def url_params
    params.require(:url).permit(:full_url)
  end
end
