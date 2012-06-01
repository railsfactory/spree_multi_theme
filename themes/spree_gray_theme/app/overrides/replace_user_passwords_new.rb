Deface::Override.new(:virtual_path => %q{spree/user_passwords/new},
                          :name => %q{replace_user_passwords_new},
                          :replace => %q{#forgot-password},
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

<% if !request.url.include?"new"%>
<div class="flash errors">
 <%=devise_error_messages!%>
 </div>
 <%end%>
<div class="wrapper-lb">
<h2><%= t(:forgot_password) %></h2>

<%= form_for Spree::User.new, :as => :user, :url => spree.user_password_path do |f| %>
 <div class="fm-elements">
                <label for="user_email"><%= t(:email) %></label>
                <div class="input-wrap">
                  <%= f.text_field :email, :class=>"txt-fld"%>
                    <div class="error"></div>
                </div>
            </div>
             <div class="fm-elements">
                <%= f.submit t("reset_password") , :class=>"button primary"%>
            </div>

<% end %>
</div>})
