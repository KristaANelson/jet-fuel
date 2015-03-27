class UrlsController < ApplicationController
  def create
    url = Url.new(url_params)
    if url.save
      redirect_to url_path(url)
    else
      redirect_to root_path
    end
  end

  def show
    @url = Url.find(params[:id])
  end

private

  def url_params
    params.require(:url).permit(:full_url)
  end
end
