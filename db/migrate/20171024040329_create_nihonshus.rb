class CreateNihonshus < ActiveRecord::Migration[5.0]
  def change
    create_table :nihonshus do |t|
      t.string :name
      t.integer :acidity
      t.integer :taste
      t.integer :body
      t.string :region
      t.float :price
      t.string :temp
      t.string :sku
      t.string :classification
      t.string :aroma

      t.timestamps
    end
  end
end
