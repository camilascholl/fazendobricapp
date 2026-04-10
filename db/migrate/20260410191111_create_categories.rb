class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :description, limit: 60 #max 60 caracteres varchar

      t.timestamps null:false
    end
  end
end
