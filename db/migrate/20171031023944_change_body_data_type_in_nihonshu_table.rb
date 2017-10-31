class ChangeBodyDataTypeInNihonshuTable < ActiveRecord::Migration[5.0]
  def up
    change_column :nihonshus, :body, :string
  end

  def down
    change_column :nihonshus, :body, :integer
  end
end
