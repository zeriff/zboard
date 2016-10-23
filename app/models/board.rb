class Board < ApplicationRecord
  has_many :pins, dependent: :destroy
  belongs_to :user
end
