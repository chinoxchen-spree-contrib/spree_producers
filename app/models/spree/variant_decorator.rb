module Spree::VariantDecorator
  def self.prepended(base)
    base.before_create :assign_producer_id
  end

  def producer_id
    self.class.method_defined?(:producer) ? self[:producer_id] : product.producer_id
  end

  private

  def assign_producer_id
    return unless self.class.method_defined?(:producer)

    self.producer_id = product.producer_id
  end
end

Spree::Variant.prepend Spree::VariantDecorator
