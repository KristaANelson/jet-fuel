class UrlsController < ApplicationController
  def create
    url = Url.new(url_params)
    if url.save
      redirect_to url_path(url)
    else
      flash[:errors] = "Invalid URL"
      redirect_to root_path
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  def redirect
    @url = Url.find_by(short_url: params[:short_url])
    redirect_to @url.full_url
  end

  private

  def url_params
    params.require(:url).permit(:full_url)
  end
end
