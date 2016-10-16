class Board < ApplicationRecord
  has_many :pins
  belongs_to :user
end
