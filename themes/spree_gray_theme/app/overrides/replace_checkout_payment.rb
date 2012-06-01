Deface::Override.new(:virtual_path => %q{spree/checkout/_payment},
                          :name => %q{replace_checkout_payment},
                          :replace => %q{#payment[data-hook]},
                          :text => %q{
<fieldset id="payment" data-hook>
<h5 class="subhead"><%= t(:payment_information) %></h5>
  <div data-hook="checkout_payment_step">
    <% @order.available_payment_methods.each do |method| %>
    <p>
      <label>
        <%= radio_button_tag "order[payments_attributes][][payment_method_id]", method.id, method == @order.payment_method %>
        <%= t(method.name, :scope => :payment_methods, :default => method.name) %>
      </label>
    </p>
    <% end %>
    <ul id="payment-methods" data-hook>
      <% @order.available_payment_methods.each do |method| %>
        <li id="payment_method_<%= method.id %>" class="<%= 'last' if method == @order.available_payment_methods.last %>" data-hook>
          <fieldset>
            <%= render :partial => "spree/checkout/payment/#{method.method_type}", :locals => { :payment_method => method } %>
          </fieldset>
        </li>
      <% end %>
    </ul>
    <br style="clear:both;" />
   <div class="field_wrap">
          <label>Coupon Code </label>
          <div class="input_wrap">
            <%= form.text_field :coupon_code, :size => 19,:class=>"txtinput coupon_code" %>
          </div>
        </div>
  </div>
</fieldset>})
