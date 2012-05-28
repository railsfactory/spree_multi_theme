Deface::Override.new(:virtual_path => %q{spree/orders/_line_item},
                          :name => %q{replace_orders_line_item},
                          :replace => %q{tr},
                          :text => %q{
<tr class="<%= cycle('', 'alt') %> line-item">
  <td data-hook="cart_item_image">
    <% if variant.images.length == 0 %>
      <%= link_to small_image(variant.product), variant.product %>
    <% else %>
      <%= link_to image_tag(variant.images.first.attachment.url(:small)), variant.product %>
    <% end %>
  </td>
  <td data-hook="cart_item_description">
    <h4 class="wod_brk"><%= link_to variant.product.name, product_path(variant.product) %></h4>
    <%= variant.options_text %>
    <% if @order.insufficient_stock_lines.include? line_item %>
      <span class="out-of-stock">
        <%= variant.in_stock? ? t(:insufficient_stock, :on_hand => variant.on_hand) : t(:out_of_stock) %><br />
      </span>
    <% end %>
    <p class="wod_brk"><%= truncate(variant.product.description, :length => 100, :omission => "...") %></p>
  </td>
  <td data-hook="cart_item_price">
    <%= number_to_currency line_item.price %>
  </td>
  <td data-hook="cart_item_quantity">
    <%= item_form.text_field :quantity, :min => 0, :class => "line_item_quantity txt_qty", :size => 3 ,:maxlength=>4 %>
  </td>
  <td data-hook="cart_item_total">
    <%= number_to_currency(line_item.price * line_item.quantity) unless line_item.quantity.nil? %>
  </td>
  <td data-hook="cart_item_delete">
    <%= link_to image_tag('icons/delete.png'), '#', :class => 'delete', :id => "delete_#{dom_id(line_item)}" %>
  </td>
</tr>})
