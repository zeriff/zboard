class SearchController < ApplicationController
  respond_to :js
  def search
    pins = Pin.where('title LIKE ?', "%#{params[:query]}%")
    users = User.where('username LIKE ?', "%#{params[:query]}%")
    a = pins + users
    res = SearchResponse.new(a, users)
    respond_to do |format|
      format.json  { render json: res }
    end
  end

  def locationSearch
    search = Geocoder.search(params[:query]).first
    @search = search.address_components
    locations = Array.new
    @city = ""
    @country = ""
    @search.each do |item|
      if item["types"].include?("locality")
        @city = item["long_name"]
      end
      if item["types"].include?("country")
        @country = item["long_name"]
      end
    end
    locations.push(LocationResponseModel.new(@city, "", @country))
    res = SearchResponse.new(locations, [])
    respond_to do |format|
        format.json  { render json: res  }
      end
  end
end
