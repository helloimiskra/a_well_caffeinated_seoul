class CreateCafes < ActiveRecord::Migration[5.2]
  def change
    create_table :cafes do |t|
      t.string :name
      t.string :location
      t.string :parking
      t.string :americano_price
      t.string :dog_friendly
      t.string :outlets
      t.text :review
      t.integer :user_id
    end
  end
end
