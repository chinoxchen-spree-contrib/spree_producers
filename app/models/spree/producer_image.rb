module Spree
  class ProducerImage < Asset
    include Spree::Image::Configuration::ActiveStorage
    include Rails.application.routes.url_helpers

    before_save :change_key

    def change_key
      return if self.attachment.key.split('/').length == 2
      self.attachment.key = "#{attachment.key}.#{attachment.content_type.split('/').second}"
    end

    def styles
      self.class.styles.map do |_, size|
        width, height = size[/(\d+)x(\d+)/].split('x')

        {
          url: polymorphic_path(attachment.variant(resize: size), only_path: true),
          width: width,
          height: height
        }
      end
    end
  end
end
