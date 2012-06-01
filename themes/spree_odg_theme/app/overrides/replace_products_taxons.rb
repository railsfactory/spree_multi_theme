Deface::Override.new(:virtual_path => %q{spree/products/_taxons},
                          :name => %q{replace_products_taxons},
                          :replace => %q{#taxon-crumbs[data-hook]},
                          :text => %q{
<div id="taxon-crumbs" data-hook class="columns five omega">
  <h5 class="product-section-title"><%= t(:look_for_similar_items) %></h5>
  <div data-hook="product_taxons">
  <div class="similar-items">
    <ul id="similar_items_by_taxon" data-hook>
    <% @product.taxons.each do |taxon| %>
      <li><%= link_to taxon.name, seo_url(taxon) %></li>
    <% end %>
    </ul>
  </div>
  </div>
</div>})
