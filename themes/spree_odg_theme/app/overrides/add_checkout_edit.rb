Deface::Override.new(:virtual_path => %q{spree/checkout/edit},
                          :name => %q{add_checkout_edit},
                          :insert_before  => %q{#checkout[data-hook]},
                          :text => %q{
<% content_for :sidebar do %>
  <div data-hook="homepage_sidebar_navigation">
    <% if "products" == @current_controller && @taxon %>
      <%= render :partial => 'spree/shared/filters' %>
    <% else %>
      <%= render :partial => 'spree/shared/taxonomies' %>
    <% end %>
  </div>
<% end %>})
