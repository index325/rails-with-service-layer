class User < ApplicationRecord
  has_many :permissions
  validates :name, presence: true
  validates :user_type, presence: true
  validates :active, presence: true
end
