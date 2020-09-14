class AddLocalFlag < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_producers, :local, :boolean, default: false
  end
end
