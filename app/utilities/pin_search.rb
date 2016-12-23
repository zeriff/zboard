class PinSearch
    def searchAll(_query)
        @res = PgSearch.multisearch("%#{_query}%")
        @result = @res.pluck(:searchable_type, :searchable_id)
        @finalresult = []
        @result.each do |item|
            if item[0] == 'Pin'
                @pin = Pin.find(item[1])
                @finalresult.push(title: @pin.title,
                                  img: @pin.image.thumb.url.to_s,
                                  content: @pin.description,
                                  ref: 'pins/' + @pin.id.to_s)
            elsif item[0] == 'User'
                @user = User.find(item[1])
                @finalresult.push(title: @user.username,
                                  img: @user.avatar.thumb.url,
                                  content: @user.intrest,
                                  ref: 'users/' + @user.username)
            end
        end
        @finalresult
    end

    def searchPins(_query)
        res = PgSearch.multisearch("%#{_query}%")
        result = res.pluck(:searchable_id)
        Pin.find(result)
    end
end
