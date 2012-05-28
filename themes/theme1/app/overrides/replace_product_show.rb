Deface::Override.new(:virtual_path => %q{spree/products/show},
                          :name => %q{replace_product_show},
                          :replace => %q{[data-hook='product_show']},
													:sequence => {:before => 'replace_products_cart_form' },
                          :text => %q{<div data-hook="product_show" itemscope itemtype="http://schema.org/Product">
<% content_for :sidebar do %>
  <div data-hook="homepage_sidebar_navigation">
      <%= render :partial => 'spree/shared/taxonomies' %>
  </div>
<% end %>

<% @body_id = 'product-details' %>
<div class="secblock">
<!--<h4 class="sechead"><%#= accurate_title %></h4>-->
							<div class="prod-detail">
								<div class="prod-info-wrap bor_bot over_visible">
									<div class="img-container" id="product-images">
									  <%#= hook :product_images do %>
										      <div id="product-images" data-hook="product_images">
                    <div id="main-image" data-hook>
										<div class="img-large" id="main-image">
											<%= render 'image' %>
										</div>
										</div>
										<div class="img-thumbs" id="thumbnails">
										        <div id="thumbnails" data-hook>
											 <%= render 'thumbnails', :product => @product %>
										</div>
										</div>
										</div>
									<%#end%>
									</div>

								<div class="prod-info">
							<h2><%= accurate_title %></h2>
							<div class="coll-info">	
      <div data-hook="product_properties">
									<%= render 'properties' %>
				</div>
								
        <div id="cart-form" data-hook="cart_form">
											<%= render 'cart_form' %>
</div>
									
									</div>
						</div>
							<div class="clear"></div>
								</div>
								<div class="prod-info-wrap bor_bot pdt_desc">
									<h5 class="subhead">Product Description</h5>
									<p>  <%#= hook :product_description do %>
													<%= product_description(@product) rescue t("product_has_no_description") %>
									<%# end %></p>
								</div>
								
							<%= render 'taxons' %>
							
							</div>
</div>
})

