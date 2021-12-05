# frozen_string_literal: true

require 'flickr'

# Static Pages Controller class
class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new ENV['FLICKR_KEY'], ENV['FLICKR_SECRET']
    @tags = session[:tags] == '' ? 'otter' : session[:tags]
    response = flickr.photos.search(tags: @tags)
    @photos = response.map do |p|
      "https://farm#{p.farm}.staticflickr.com/#{p.server}/#{p.id}_#{p.secret}.jpg"
    end
  end

  def create
    session[:tags] = params[:tags]
    redirect_to root_path
  end
end