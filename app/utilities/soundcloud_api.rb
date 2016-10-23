class SoundcloudApi
  include Oembed::Client

  def endpoint_uri
    'http://soundcloud.com/oembed.json?url='
  end
end
