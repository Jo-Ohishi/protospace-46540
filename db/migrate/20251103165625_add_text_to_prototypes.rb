class AddTextToPrototypes < ActiveRecord::Migration[7.1]
  def change
    add_column :prototypes, :text, :text
  end
end
