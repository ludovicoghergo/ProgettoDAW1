class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.integer :age
      t.string :sex
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :state
      t.integer :zip
      t.boolean :admin
      t.timestamps
    end

    create_table :products do |t|
      t.string :title
      t.string :category
      t.text :description
      t.float :price
      t.integer :quantity
      t.timestamps
    end

    create_table :comments do |t|
      t.string :title
      t.string :text
      t.integer :user_id
      t.integer :product_id
      t.timestamps
    end

  end
end
