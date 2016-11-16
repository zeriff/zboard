class YoutubeApi
  include Oembed::Client

  def endpoint_uri
    'https://www.youtube.com/oembed'
  end
  def fetch(url, options={})
     super url, options.merge(maxwidth: 400)
  end
end
