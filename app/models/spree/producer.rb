module Spree
  class Producer < Spree::Base
    extend FriendlyId

    acts_as_paranoid
    acts_as_list column: :priority
    friendly_id :name, use: %i[slugged history]

    validates :name,
              presence: true,
              uniqueness: { case_sensitive: false }

    validates :slug, uniqueness: true
    validates_associated :image if Spree.version.to_f >= 3.6
    validates :phone, numericality: { only_integer: true }, length: { maximum: 15 }
    validates :email, email: true, allow_blank: true, allow_nil: true

    with_options dependent: :destroy do
      if Spree.version.to_f >= 3.6
        has_one :image, as: :viewable, dependent: :destroy, class_name: 'Spree::ProducerImage'
      end
      has_many :products
      has_many :variants
    end

    state_machine :state, initial: :pending do
      event :activate do
        transition to: :active
      end

      event :block do
        transition to: :blocked
      end
    end

    scope :active, -> { where(state: 'active') }

    self.whitelisted_ransackable_attributes = %w[name state]

    # Spree Globalize support
    # https://github.com/spree-contrib/spree_multi_vendor/issues/104
    if defined?(SpreeGlobalize)
      attr_accessor :translations_attributes
      translates :name,
                 :about_us,
                 :slug, fallbacks_for_empty_translations: true
    end

    private

    def should_generate_new_friendly_id?
      slug.blank? || name_changed?
    end
  end
end
