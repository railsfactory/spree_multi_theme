Deface::Override.new(:virtual_path => %q{spree/checkout/registration},
                          :name => %q{replace_checkout_registration},
                          :replace => %q{#guest_checkout},
                          :text => %q{
<div id="guest_checkout" data-hook class="columns omega eight">
   <div class="wrapper-lb">
    <%= render :partial => 'spree/shared/error_messages', :locals => { :target => @order } %>
    <h2><%= t(:guest_user_account) %></h2>
    <%= form_for @order, :url => update_checkout_registration_path, :method => :put, :html => { :id => 'checkout_form_registration' } do |f| %>
          <p>
            <div class="fm-elements">
                <%= f.label :email, t(:email) %><br />
               <%= f.email_field :email, :class => 'title' %>
            </div>
          </p>
          <p><%= f.submit t(:continue), :class => 'button primary' %></p>
    <% end %>
  </div>
</div>})
