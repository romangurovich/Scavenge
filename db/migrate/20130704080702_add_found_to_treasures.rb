class AddFoundToTreasures < ActiveRecord::Migration
  def change
    add_column :treasures, :found, :boolean, default: false
  end
end
