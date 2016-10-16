class User < ApplicationRecord
  include BoardsHelper
  mount_uploader :avatar, AvatarUploader 
  after_create :initiate_boards_for_user

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter

  has_many :pins
  has_many :boards

  acts_as_followable
  acts_as_follower

  def self.all_except(user)
    where.not(id: user)
  end
end
