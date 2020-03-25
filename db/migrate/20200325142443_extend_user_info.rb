class ExtendUserInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :age, :integer
    add_column :users, :image_path, :string, default: 'default_gravatar.jpg'
  end
end
