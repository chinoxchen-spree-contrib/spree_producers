module Spree
  class ProducersController < Spree::StoreController
    before_action :load_producers, only: [:index, :show]
    before_action :load_producer, only: [:show]

    respond_to :html

    def index
      @producers = Spree::Producer.all.active
    end

    def show; end

    private

    def load_producers
      @producers = Spree::Producer.all.active
    end

    def load_producer
      @producer = @producers.friendly.find(params[:id])
    end
  end
end
