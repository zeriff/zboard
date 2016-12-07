class SearchController < ApplicationController
  respond_to :js
  layout 'search'

  def search

  end

  def find
    @res = PgSearch.multisearch("%#{params[:query]}%")
    @result = @res.pluck(:searchable_type, :searchable_id);
    @finalresult = []
    @result.each do |item|
      if item[0] == "Pin"
        @pin = Pin.find(item[1]);
        @finalresult.push({
            title: @pin.title,
            img: @pin.image.thumb.url.to_s,
            content: @pin.description,
            ref:'pins/' + @pin.id.to_s
        })
      elsif item[0] == "User"
        @user = User.find(item[1])
        @finalresult.push({
            title: @user.username,
            img: @user.avatar.thumb.url,
            content: @user.intrest,
            ref:@user.username
        })
      end
    end
    render json: @finalresult
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

  private

  def getavatar(user)
    if user.avatar_url == nil
      if user.gender == 0
        return "https://s3.ap-south-1.amazonaws.com/zboarddefaults/boy.png";
      else
        return "https://s3.ap-south-1.amazonaws.com/zboarddefaults/girl.png";
      end
    else
      return user.avatar.mini.url
    end
  end

end
