Deface::Override.new(:virtual_path => %q{spree/orders/show},
                          :name => %q{replace_orders_show},
                          :replace => %q{#order_summary[data-hook]},
                          :text => %q{
<% content_for :sidebar do %>
      <%= render "spree/shared/taxonomies" %>
<%end%>

<fieldset id="order_summary" data-hook>
  <h2><legend><%= t(:order) + " #" + @order.number %></legend><h2><br/>
  <h1><%= accurate_title %></h1>

<div id="order" data-hook>
  <% if params.has_key? :checkout_complete %>
    <h3><%= t(:thank_you_for_your_order) %></h3>
  <% end %>
  <%= render :partial => 'spree/shared/order_details', :locals => { :order => @order } %>

  <br class="clear" />
  <div data-hook="links" class="form-buttons">
    <%= link_to t(:back_to_store), spree.root_path, :class => "button" %>
    <% unless params.has_key? :checkout_complete %>
      <% if respond_to?(:current_user) && current_user %>
        <%#= link_to t(:my_account), spree.account_path, :class => "button" %>
      <% end %>
    <% end %>
  </div>
</div>
</fieldset>

})
