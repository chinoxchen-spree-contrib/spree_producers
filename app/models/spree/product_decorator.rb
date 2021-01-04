module Spree::ProductDecorator
  Spree::Product.whitelisted_ransackable_associations += %w[producer]

  def self.prepended(base)
    base.scope :in_stock, -> { joins(master: :prices, variants: :stock_items).where("#{Spree::StockItem.quoted_table_name}.count_on_hand > 0 AND #{Spree::Product.quoted_table_name}.available_on <= ?", Time.now).uniq }
  end

  def local?
    producer.local?
  rescue
    false
  end
end

Spree::Product.prepend Spree::ProductDecorator
