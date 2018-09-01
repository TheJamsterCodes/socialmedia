class AddValuesToUsers < ActiveRecord::Migration[5.2]
  def change
  	# Ruby's format to adding into the table
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :location, :string
  end
end
