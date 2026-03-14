class Message < ApplicationRecord
  belongs_to :user
  belongs_to :message_board
  has_one_attached :image
  has_rich_text :body
end
