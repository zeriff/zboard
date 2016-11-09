class User < ApplicationRecord
  include BoardsHelper
  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, CoverUploader

  after_create :initiate_boards_for_user
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter
  acts_as_saver

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :profession, :intrest


  # validates :username, presence: true
  # validates :gender, presence: true

  has_many :pins, dependent: :destroy
  has_many :boards, dependent: :destroy

  acts_as_followable
  acts_as_follower

  def self.all_except(user)
    where.not(id: user).where.not(is_an_admin: true)
  end
end
