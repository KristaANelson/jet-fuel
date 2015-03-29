class Api::V1::WelcomeController < ApplicationController
  respond_to :xml, :json

  def index
    respond_with @urls = Url.all
  end
end
