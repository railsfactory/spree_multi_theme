Deface::Override.new(:virtual_path => %q{spree/user_sessions/new},
                          :name => %q{add_user_sessions_new},
                          :insert_before => %q{#existing-customer},
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
