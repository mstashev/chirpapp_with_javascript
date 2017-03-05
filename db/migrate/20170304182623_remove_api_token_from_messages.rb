class RemoveApiTokenFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :api_token, :string
  end
end
