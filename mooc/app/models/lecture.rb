require 'carrierwave/orm/activerecord'
class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  mount_uploader :attachment, AvatarUploaderFile

  validates :content,  presence: true, length: { in: 6..5000 }

  has_many :likes
  has_many :users, through: :likes

  has_many :spams
  has_many :users, through: :spams

  has_many :comments
  has_many :users, through: :comments
end
