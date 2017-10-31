class AddImageUrlToNihonshusTable < ActiveRecord::Migration[5.0]
  def change
    add_column :nihonshus, :image_url, :string
  end
end
