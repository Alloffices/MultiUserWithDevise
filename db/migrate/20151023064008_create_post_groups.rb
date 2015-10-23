class CreatePostGroups < ActiveRecord::Migration
  def change
    create_table :post_groups do |t|
    	t.references :posts
    	t.references :users
    end
  end
end
