class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.integer :age
      t.string :sex
      t.string :username
      t.string :email
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
