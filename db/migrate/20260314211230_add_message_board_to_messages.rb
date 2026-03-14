class AddMessageBoardToMessages < ActiveRecord::Migration[8.1]
  def change
    add_reference :messages, :message_board, null: false, foreign_key: true
  end
end
