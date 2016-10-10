json.extract! pin, :id, :title, :description, :remote_image_url, :created_at, :updated_at
json.url pin_url(pin, format: :json)
