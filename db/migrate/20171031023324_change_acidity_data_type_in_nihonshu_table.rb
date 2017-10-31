class ChangeAcidityDataTypeInNihonshuTable < ActiveRecord::Migration[5.0]
  def up
    change_column :nihonshus, :acidity, :float
  end

  def down
    change_column :nihonshus, :acidity, :integer
  end
end
