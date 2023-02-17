class Comment < ApplicationRecord
  belongs_to :review
  validates :content, presence: true
  validates :c_nickname, presence: true
end
