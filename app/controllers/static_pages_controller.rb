require 'flickr'

class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new ENV['FLICKR_KEY'], ENV['FLICKR_SECRET']
    @user_id = session[:user_id]
    session[:user_id] = nil
    response = flickr.photos.search(user_id: @user_id)
    @photos = response.each { |photo| puts photo }
  end

  def create
    session[:user_id] = params[:user_id]
    redirect_to root_path
  end
end
