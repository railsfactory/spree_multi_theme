Deface::Override.new(:virtual_path => %q{spree/shared/_products},
                          :name => %q{replace_shared_products},
                          :replace => %q{#products[data-hook]},
                          :text => %q{
<ul id="products" class="inline product-listing" data-hook>
  <% reset_cycle('default') %>
  <% products.each do |product| %>
    <% if Spree::Config[:show_zero_stock_products] || product.has_stock? %>
      <li id="product_<%= product.id %>" class="templatemo_product_box columns three <%= cycle("alpha", "secondary", "", "omega secondary") %>" data-hook="products_list_item" itemscope itemtype="http://schema.org/Product">
      <h1><%= link_to truncate(product.name, :length => 50), product, :class => 'info', :itemprop => "name", :title => product.name %></h1>

          <%= link_to small_image(product, :itemprop => "image"), product, :itemprop => 'url' %>
<div class="product_info">
<p> <%=truncate(product.description, :length => 50)%></p>

        <span class="price selling" itemprop="price"><%= number_to_currency product.price %></span>
        <div class="buy_now_button">
        <br />
        <%= link_to truncate('Buy', :length => 50), product, :class => '', :itemprop => "name", :title => product.name %>
        </div>
        </div>
      </li>
    <% end %>
  <% end %>
</ul>})
