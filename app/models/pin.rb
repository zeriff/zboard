class Pin < ApplicationRecord
  include PgSearch

  multisearchable :against => [:title, :author, :parent_provider]

  mount_uploader :image, PinImageUploader
  attr_accessor :host
  belongs_to :board, class_name: 'Board'
  belongs_to :user

  acts_as_votable
  acts_as_saveable

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :genre

  validates :title, presence: true
  validates :pin_url, presence: true
  validates :board_id, presence: true

   self.per_page = 20
end
