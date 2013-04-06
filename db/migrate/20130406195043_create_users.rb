class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :cell
      t.string :image
      t.string :image_file_name
      t.string :image_content_type

      t.timestamps
    end
  end
end
