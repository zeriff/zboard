class Pin < ApplicationRecord
  mount_uploader :image, PinImageUploader
  attr_accessor :host
  belongs_to :category, class_name: 'Category'
  belongs_to :board, class_name: 'Board'
  belongs_to :user

  acts_as_votable

  validates :title, presence: true
  validates :category_id, presence: true
  validates :pin_url, presence: true
  validates :board_id, presence: true

   self.per_page = 15
end
