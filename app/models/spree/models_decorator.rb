module Spree::ModelsDecorator
  SpreeProducer.producer_models.each do |model|
    model.include Spree::ProducerConcern
  end
end
