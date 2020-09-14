module Spree::ProductDecorator
  Spree::Product.whitelisted_ransackable_associations += %w[producer]

  def local?
    producer.local?
  rescue
    false
  end
end

Spree::Product.prepend Spree::ProductDecorator
