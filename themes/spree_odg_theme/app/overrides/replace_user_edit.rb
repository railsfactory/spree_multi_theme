Deface::Override.new(:virtual_path => %q{spree/users/edit},
                          :name => %q{replace_user_edit},
                          :replace => %q{h2},
                          :closing_selector => %q{code[erb-loud]:contains('end')},
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
<h2><%= t("editing_user") %></h2>
<%= form_for @user, :url => spree.user_path(@user), :method => :put do |f| %>
<%= render 'spree/shared/user_form', :f => f %>
<div class="fm-elements">
 <%=submit_tag t("update"), :class => 'button primary'  %>
</div>})
