class CreateFood < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.integer :calories
      t.string :name
    end
  end
end
