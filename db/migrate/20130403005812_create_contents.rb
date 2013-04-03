class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.text :text
      t.references :category

      t.timestamps
    end
    add_index :contents, :category_id
  end
end
