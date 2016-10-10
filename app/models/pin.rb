class Pin < ApplicationRecord
  belongs_to :user
  mount_uploader :image, PinImageUploader
end
