module Spree
  module Admin
    class ProducersController < ResourceController

      def create
        if permitted_resource_params[:image] && Spree.version.to_f >= 3.6
          @producer.build_image(attachment: permitted_resource_params.delete(:image))
        end
        super
      end

      def update
        if permitted_resource_params[:image] && Spree.version.to_f >= 3.6
          @producer.create_image(attachment: permitted_resource_params.delete(:image))
        end
        format_translations if defined? SpreeGlobalize
        super
      end

      def update_positions
        params[:positions].each do |id, position|
          producer = Spree::Producer.find(id)
          producer.set_list_position(position)
        end

        respond_to do |format|
          format.js { render plain: 'Ok' }
        end
      end

      private

      def find_resource
        Producer.with_deleted.friendly.find(params[:id])
      end

      def collection
        params[:q] = {} if params[:q].blank?
        producers = super.order(priority: :asc)
        @search = producers.ransack(params[:q])

        @collection = @search.result.
            page(params[:page]).
            per(params[:per_page])
      end

      def format_translations
        return if params[:producer][:translations_attributes].blank?
        params[:producer][:translations_attributes].each do |_, data|
          translation = @producer.translations.find_or_create_by(locale: data[:locale])
          translation.name = data[:name]
          translation.about_us = data[:about_us]
          translation.slug = data[:slug]
          translation.save!
        end
      end
    end
  end
end
