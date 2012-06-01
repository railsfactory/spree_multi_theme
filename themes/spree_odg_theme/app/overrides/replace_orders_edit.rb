Deface::Override.new(:virtual_path => %q{spree/orders/edit},
                          :name => %q{replace_orders_edit},
                          :replace => %q{h1},
                          :closing_selector => %q{#empty-cart[data-hook]},
                          :text => %q{
<% content_for :sidebar do %>
  <div data-hook="taxon_sidebar_navigation">
    <%= render :partial => 'spree/shared/taxonomies' %>
  </div>
<% end %>

<% @body_id = 'cart' %>

<h4 class="taxonomy-root"><%= t(:shopping_cart) %></h4>

<% if @order.line_items.empty? %>

  <div data-hook="empty_cart">
    <br/><p><%= t(:your_cart_is_empty) %></p><br/>
    <h3><%= link_to t(:continue_shopping), products_path, :class => 'button continue' %></h3>
  </div>

<% else %>
  <div data-hook="outside_cart_form">
    <%= form_for @order, :url => update_cart_path, :html => {:id => 'update-cart'} do |order_form| %>
      <div data-hook="inside_cart_form">
        <div data-hook="cart_items">
          <%= render :partial => 'form', :locals => { :order_form => order_form } %>
        </div>
              <div class="addtocart-btns">
                <div class="btns-left">
                </div>
                <div class="btns-right">
                 <input type="submit" class="button primary" name="commit" value="Update" />
                </div>
              </div>
     </div>
    <% end %>
  </div>
    <div class="addtocart-btns">
    <div class="btns-left">
    <%= link_to t(:continue_shopping), products_path, :class => 'continue button' %>
  <span id="empty-cart" data-hook>
  <%= form_tag empty_cart_path, :method => :put do %>
    <p id="clear_cart_link" data-hook>
      <%= submit_tag t(:empty_cart), :class => 'button primary' %>
      <%#= t(:or) %>
    </p>
  <% end %>
       <%= link_to t(:checkout), checkout_path, :class => 'button checkout primary', :id => 'checkout-link' %>
  </span></div>
  <div class="btns-right">

    </div>
    </div>


})
