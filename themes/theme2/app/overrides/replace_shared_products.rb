Deface::Override.new(:virtual_path => %q{spree/shared/_products},
                          :name => %q{replace_shared_products},
                          :replace => %q{#products[data-hook]},
                          :text => %q{
<ul id="products" class="inline product-listing collection-img-wrap" data-hook>
  <% reset_cycle('default') %>
  <% products.each_with_index do |product,index| %>
    <% if Spree::Config[:show_zero_stock_products] || product.has_stock? %>
      <li id="product_<%= product.id %>" class="col-left-wrap  columns three <%= cycle("alpha", "secondary", "", "omega secondary")%> col-left-wrap #{index%2==0 ? "" : "right-side"}" data-hook="products_list_item" itemscope itemtype="http://schema.org/Product">
      <div class="coll-left">
        <div class="product-image coll-img">
          <%= link_to large_image(product,:width=>"184",:height=>"116", :itemprop => "image"), product, :itemprop => 'url'"116" %>
        </div>
            <div class="coll-info">
                <p><%= truncate((raw strip_tags(product.name)),:length => 35) %></p>
                <div class="price-enlarge-buy">
                  <p class="price"><span></span><%= number_to_currency product.price %></p>
                  <%= link_to raw("BUY IT"), product, :class => 'buy-it' %>
                </div>
            </div>
        </div>
        <div class="line-btm"></div>
      </li>
    <% end %>
  <% end %>
</ul>})
