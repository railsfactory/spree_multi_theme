Deface::Override.new(:virtual_path => %q{spree/products/show},
                          :name => %q{replace_product_show},
                          :insert_before => %q{[data-hook='product_show']},
                          :text => %q{

<% content_for :sidebar do %>
  <div data-hook="homepage_sidebar_navigation">
      <%= render :partial => 'spree/shared/taxonomies' %>
  </div>
<% end %>

})

