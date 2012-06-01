Deface::Override.new(:virtual_path => %q{spree/users/show},
                          :name => %q{replace_user_show},
                          :replace => %q{h3},
                          :closing_selector => %q{[data-hook="account_my_orders"]},
                          :text => %q{
<% content_for :sidebar do %>
  <div data-hook="homepage_sidebar_navigation">
    <% if "products" == @current_controller && @taxon %>
      <%= render :partial => 'spree/shared/filters' %>
    <% else %>
      <%= render :partial => 'spree/shared/taxonomies' %>
    <% end %>
  </div>
<% end %>

<div class="secblock">
  <h4 class="sechead my_acct_hd"><%= t("my_account") %></h4>
                <div class="secinblock">
                  <div class="myacct-edit clearfix">
                    <div class="myacct-label">
                      <label><%= t("email") %>:</label>
                    </div>
                    <div class="myacct-field">
                      <a href="mailto:<%= @user.email %>"><%= @user.email %></a>
                    </div>
                    <div class="myacct-edit-field">
                      <%= link_to t('edit'), edit_account_path %>
                    </div>
                  </div>
                </div>
</div><!-- my account -->
<div class="secblock">
  <h4 class="sechead"><%= t("my_orders") %></h4>
                <div class="secinblock">
                  <div class="myorder">
                  <% if @orders.present? %>
                    <table cellpadding="0" cellspacing="0" class="grid-table">
                      <thead>
                        <tr>
                          <th><%= t("order_number") %></th>
                          <th><%= t("order_date") %></th>
                          <th><%= t("status") %></th>
                          <th><%= t("payment_state") %></th>
                          <th><%= t("shipment_state") %></th>
                          <th><%= t("total") %></th>
                        </tr>
                      </thead>
                      <tbody>
                      <% @orders.each do |order| %>
                        <tr>
                          <td><%= link_to order.number, order_url(order) %></td>
                          <td><%=order.created_at.to_date%></td>
                          <td><%= t(order.state).titleize %></td>
                          <td><%= t("payment_states.#{order.payment_state}") if order.payment_state %></td>
                          <td><%= t("shipment_states.#{order.shipment_state}") if order.shipment_state %></td>
                          <td><%= number_to_currency order.total %></td>
                        </tr>
                      <% end %>
                      </tbody>
                    </table>
                    <% else %>
                    <p><%= t(:you_have_no_orders_yet) %></p>
                    <% end %>
                  </div>
                </div>
</div>})
