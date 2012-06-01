Deface::Override.new(:virtual_path => %q{spree/users/show},
                          :name => %q{add_user_show},
                          :insert_before => %q{[data-hook="account_summary"]},
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
