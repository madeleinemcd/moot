class Review < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {maximum: 300}
  validates :subtitle, presence: true
  validates :category, presence: true
  validates :content, presence: true
  scope :recent, -> { order(created_at: :desc) }
  scope :last_three, -> { order(created_at: :desc).limit(6) }
  # has_one_attached :photo

  extend FriendlyId
  friendly_id :title, use: :slugged
end
