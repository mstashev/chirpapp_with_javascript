class AddApiTokenToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :api_token, :string
  end
end
