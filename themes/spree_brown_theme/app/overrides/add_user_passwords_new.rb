Deface::Override.new(:virtual_path => %q{spree/user_passwords/new},
                          :name => %q{add_user_passwords_new},
                          :insert_before => %q{#forgot-password},
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
})
