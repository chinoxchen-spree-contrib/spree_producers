require 'spree_core'
require 'spree_extension'
require 'spree_producers/engine'
require 'spree_producers/version'

module SpreeProducer
  # TODO: this should be moved into preferences
  def self.producer_models
    [
      Spree::Product,
      Spree::Variant
    ]
  end
end
