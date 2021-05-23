class AddNameEmailAndPhoneNumberToSpreeProducers < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_producers, :contact_name, :string
    add_column :spree_producers, :email, :string
    add_column :spree_producers, :phone, :integer
  end
end