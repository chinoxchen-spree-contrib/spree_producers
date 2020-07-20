Deface::Override.new(
    virtual_path: 'spree/admin/products/new',
    name: 'Enable admin to create product with assigned producer',
    insert_after: 'div[data-hook="new_product_shipping_category"]',
    text: <<-HTML
            <% if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin) %>
              <div data-hook="new_product_producer" class="col-12 col-md-4">
                <%= f.field_container :producer, class: ['form-group'] do %>
                  <%= f.label :producer_id, Spree.t(:producer) %>
                  <%= f.collection_select(:producer_id, @producers, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
                  <%= f.error_message_on :producer %>
                <% end %>
              </div>
            <% end %>
    HTML
)
