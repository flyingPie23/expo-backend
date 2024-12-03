class AddMeduimToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :meduim, :string
  end
end
