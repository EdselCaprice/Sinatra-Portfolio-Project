class CreateWishlistsTable < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.text :giftee
      t.text :list_content
      t.integer :user_id

    end
  end
end
