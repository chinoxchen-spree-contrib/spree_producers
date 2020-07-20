module Spree::ProductDecorator
  Spree::Product.whitelisted_ransackable_associations += %w[producer]
end

Spree::Product.prepend Spree::ProductDecorator
