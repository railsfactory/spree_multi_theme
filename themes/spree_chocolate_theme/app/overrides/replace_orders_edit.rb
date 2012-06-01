Deface::Override.new(:virtual_path => %q{spree/orders/edit},
                          :name => %q{replace_orders_edit},
                          :insert_before => %q{h1},
                          :text => %q{
<% content_for :sidebar do %>
  <div data-hook="taxon_sidebar_navigation">
    <%= render :partial => 'spree/shared/taxonomies' %>
  </div>
<%end%>
})
