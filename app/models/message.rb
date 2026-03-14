class Message < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_rich_text :body
end
