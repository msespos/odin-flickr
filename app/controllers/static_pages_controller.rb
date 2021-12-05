require 'flickr'

class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new ENV['FLICKR_KEY'], ENV['FLICKR_SECRET']
    @user_id = session[:user_id]
    session[:user_id] = nil
    response = flickr.photos.search(user_id: @user_id)
    @photos = response.map do |p|
      "https://farm#{p.farm}.staticflickr.com/#{p.server}/#{p.id}_#{p.secret}.jpg"
    end
  end

  def create
    session[:user_id] = params[:user_id]
    redirect_to root_path
  end
end
