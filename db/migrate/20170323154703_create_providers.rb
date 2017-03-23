sclass CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
