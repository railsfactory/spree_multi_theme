Deface::Override.new(:virtual_path => %q{spree/user_sessions/new},
                          :name => %q{replace_user_sessions_new},
                          :replace => %q{#existing-customer},
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

    <h2><%= t("login_as_existing") %></h2>

         <div hook-data="login">
    <%= render :partial => 'spree/shared/login' %>
  </div>
        <div class="sing-in-bottom">
            <%= link_to t("create_a_new_account"), signup_path %>
            <%= link_to t("forgot_password"), new_user_password_path %>
        </div>
</div>
})
