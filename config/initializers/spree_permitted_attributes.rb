module Spree
  module PermittedAttributes
    ATTRIBUTES << :producer_attributes

    mattr_reader *ATTRIBUTES

    @@producer_attributes = [:name, :about_us]
    @@producer_attributes << :image if Spree.version.to_f >= 3.6
  end
end
