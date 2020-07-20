module Spree::Admin::ProductsControllerDecorator
  def self.prepended(base)
    base.before_action :load_producers, only: [:new, :edit]
  end

  private

  def load_producers
    @producers = Spree::Producer.order(Arel.sql('LOWER(name)'))
  end
end

Spree::Admin::ProductsController.prepend Spree::Admin::ProductsControllerDecorator
