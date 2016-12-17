class SearchController < ApplicationController
    respond_to :js
    layout 'search'

    def search; end

    def find
        pinSearch = PinSearch.new
        render json: pinSearch.searchAll(params[:query])
    end

    def locationSearch
        search = Geocoder.search(params[:query]).first
        @search = search.address_components
        locations = []
        @city = ''
        @country = ''
        @search.each do |item|
            @city = item['long_name'] if item['types'].include?('locality')
            @country = item['long_name'] if item['types'].include?('country')
        end
        locations.push(LocationResponseModel.new(@city, '', @country))
        res = SearchResponse.new(locations, [])
        respond_to do |format|
            format.json { render json: res }
        end
    end
end
