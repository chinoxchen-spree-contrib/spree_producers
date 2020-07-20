Deface::Override.new(
  virtual_path:  'spree/admin/shared/_main_menu',
  name:          'producers_main_menu_tabs',
  insert_bottom: 'nav',
  text:       <<-HTML
                <% if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin) %>
                  <ul class="nav nav-sidebar border-bottom">
                    <%= tab plural_resource_name(Spree::Producer), url: admin_producers_path, icon: 'money' %>
                  </ul>
                <% end %>
HTML
)
