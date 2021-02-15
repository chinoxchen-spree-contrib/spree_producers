module Spree
  class ProducersController < Spree::StoreController
    before_action :load_producer, only: [:show]

    respond_to :html

    def index
      page = if params[:page].respond_to?(:to_i)
        params[:page].to_i <= 0 ? 1 : params[:page].to_i
      else
        1
      end

      curr_page = page || 1
      per_page = 16
      @producers = Spree::Producer.all.active.page(curr_page).per(per_page)
    end

    def show; end

    private

    def load_producer
      @producer = @producers.friendly.find(params[:id])
    end
  end
end
