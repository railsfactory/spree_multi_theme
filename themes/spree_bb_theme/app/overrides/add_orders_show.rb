Deface::Override.new(:virtual_path => %q{spree/orders/show},
                          :name => %q{replace_orders_show},
                          :insert_before => %q{#order_summary[data-hook]},
                          :text => %q{
<% content_for :sidebar do %>
      <%= render "spree/shared/taxonomies" %>
<%end%>


})
