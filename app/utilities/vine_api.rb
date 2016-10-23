class VineApi
  include Oembed::Client

  def endpoint_uri
    'https://vine.co/oembed.json?url='
  end
end
