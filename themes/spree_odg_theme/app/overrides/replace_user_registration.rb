Deface::Override.new(:virtual_path => %q{spree/user_registrations/new},
                          :name => %q{replace_user_registration},
                          :replace => %q{#new-customer},
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

<div class="wrapper-lb">
  <div id="new-customer">
    <h2><%= t("new_customer") %></h2>
    <div data-hook="signup">
    <%= form_for :user, :url => spree.user_registration_path(@user) do |f| %>
        <div data-hook="signup_inside_form">
          <%= render 'spree/shared/user_form', :f => f %>
          <div class="fm-elements">
            <%= submit_tag t("create"), :class => 'button primary' %>
          </div>
        </div>
    <% end %>
    <div class="sing-in-bottom"> <%= link_to t("login_as_existing"), login_path %></div>
  </div>
</div>})
