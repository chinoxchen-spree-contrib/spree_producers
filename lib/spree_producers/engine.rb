module SpreeProducers
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_producers'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      unless Spree::PermittedAttributes.product_attributes.include?(:due_date)
        Spree::PermittedAttributes.product_attributes << :due_date
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
