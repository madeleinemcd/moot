class Review < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  validates :title, presence: true, length: {maximum: 300}
  validates :subtitle, presence: true
  validates :category, presence: true
  validates :content, presence: true
  scope :recent, -> { order(created_at: :desc) }
  scope :last_three, -> { order(created_at: :desc).limit(6) }
  # has_one_attached :photo
end
