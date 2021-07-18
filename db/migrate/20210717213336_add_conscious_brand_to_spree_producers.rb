class AddConsciousBrandToSpreeProducers < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_producers, :conscious_brand, :boolean, default: false
  end
end
