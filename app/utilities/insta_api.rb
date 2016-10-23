class InstaApi
  include Oembed::Client

  def endpoint_uri
    'http://api.instagram.com/oembed'
  end
end
