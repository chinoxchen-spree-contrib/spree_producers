Deface::Override.new(
    virtual_path: 'spree/admin/products/_form',
    name: 'add producer',
    insert_before: 'div[data-hook="admin_product_form_taxons"]',
    text: <<-HTML
            <% if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin) %>
              <div data-hook="admin_product_form_producer">
                <%= f.field_container :producer, class: ['form-group'] do %>
                  <%= f.label :producer_id, Spree.t(:producer) %>
                  <%= f.collection_select(:producer_id, @producers, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
                  <%= f.error_message_on :producer %>
                <% end %>
              </div>
            <% end %>
          HTML
)

Deface::Override.new virtual_path:  'spree/admin/products/_form',
                     original:      'a362fae378c90638b6b9f5df7ab81d997fb68281',
                     name:          'due_date',
                     insert_bottom: '[data-hook="admin_product_form_discontinue_on"]',
                     partial:       'spree/admin/products/due_date_field'
