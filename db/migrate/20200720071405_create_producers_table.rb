class CreateProducersTable < ActiveRecord::Migration[6.0]
  def up
    create_table :spree_producers do |t|
      t.string :name
      t.string :state
      t.string :slug
      t.integer :priority
      t.text :about_us
      t.timestamps
      t.datetime :deleted_at
    end
    add_index :spree_producers, :name, unique: true
    add_index :spree_producers, :state
    add_index :spree_producers, :deleted_at
    add_index :spree_producers, :slug, unique: true

    table_names = %w[
      products
      variants
    ]

    table_names.each do |table_name|
      add_reference "spree_#{table_name}", :producer, index: true
    end

    params = { name: :string, about_us: :text, slug: :string }
    if defined?(SpreeGlobalize)
      Spree::Producer.create_translation_table!(params, { migrate_data: true })
    end
  end

  def down
    if defined?(SpreeGlobalize)
      Spree::Producer.drop_translation_table! migrate_data: true
    end

    drop_table :spree_producers
  end
end
