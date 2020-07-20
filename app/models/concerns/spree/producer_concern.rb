module Spree
  module ProducerConcern
    extend ActiveSupport::Concern

    included do
      belongs_to :producer, class_name: 'Spree::Producer'

      scope :with_producer, ->(producer_id) { where(producer_id: producer_id) }
    end
  end
end
