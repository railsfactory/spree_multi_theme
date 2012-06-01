Deface::Override.new(:virtual_path => %q{spree/orders/_form},
                          :name => %q{replace_orders_form},
                          :replace => %q{#cart-detail[data-hook]},
                          :text => %q{
<table cellspacing="0" cellpadding="0" class="grid-table add-to-cart"  id="cart-detail" data-hook>
  <thead>
    <tr data-hook="cart_items_headers">
      <th class="item"><%= t("item") %></th>
            <th class="desc">Description</th>
            <th class="price"><%= t("price") %></th>
            <th class="qty"><%=t("qty")%></th>
            <th class="total"><%= t("total") %></th>
            <th class="delete_link"></th>
    </tr>
  </thead>
  <tbody id="line_items" data-hook>
    <%= order_form.fields_for :line_items do |item_form| %>
      <%= render :partial => 'line_item', :locals => { :variant => item_form.object.variant, :line_item => item_form.object, :item_form => item_form } %>
    <% end %>

     <tr class="subtotal">
        <td colspan="4">Subtotal:</td>
        <td><%= order_subtotal(@order) %></td>
        <td>&nbsp;</td>
    </tr>
  </tbody>
</table>})
