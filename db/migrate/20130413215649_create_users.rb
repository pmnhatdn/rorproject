class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_confirmation
      t.string :email
      t.string :fullname
      t.string :remember_token
      t.string :password_digest

      t.timestamps
    end
  end
end
