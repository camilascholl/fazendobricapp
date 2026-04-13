class HomeController < ApplicationController
  def index
    @categories = Category.order(:description).limit(8)
    @featured_ads = Ad.includes(:category, :member).order(created_at: :desc).limit(8)
  end
end
