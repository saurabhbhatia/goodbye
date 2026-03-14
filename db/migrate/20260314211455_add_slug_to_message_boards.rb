class AddSlugToMessageBoards < ActiveRecord::Migration[8.1]
  def change
    add_column :message_boards, :slug, :string
    add_index :message_boards, :slug, unique: true
  end
end
