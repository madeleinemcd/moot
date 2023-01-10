class Review < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {maximum: 140}
  validates :subtitle, presence: true, length: {maximum: 140}
  validates :category, presence: true
  validates :body, presence: true
  extend FriendlyId
  friendly_id :title, use: :slugged
  scope :recent, -> { order(created_at: :desc) }
  scope :last_three, -> { order(created_at: :desc).limit(6) }
  # has_one_attached :photo
end
