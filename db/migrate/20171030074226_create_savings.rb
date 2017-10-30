class CreateSavings < ActiveRecord::Migration[5.0]
  def change
    create_table :savings do |t|
      t.references :nihonshu, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
