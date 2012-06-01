Deface::Override.new(:virtual_path => %q{spree/user_registrations/new},
                          :name => %q{add_user_registration},
                          :insert_before => %q{#new-customer},
                          :text => %q{
<% content_for :sidebar do %>
  <div data-hook="homepage_sidebar_navigation">
    <% if "products" == @current_controller && @taxon %>
      <%= render :partial => 'spree/shared/filters' %>
    <% else %>
      <%= render :partial => 'spree/shared/taxonomies' %>
    <% end %>
  </div>
<% end %>
})
