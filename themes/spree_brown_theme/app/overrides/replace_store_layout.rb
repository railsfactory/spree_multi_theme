Deface::Override.new(:virtual_path => %q{spree/layouts/spree_application},
                          :name => %q{replace_store_layout},
                          :replace => %q{body},
                          :text => %q{
<body>
<!--  Free CSS Templates from www.templatemo.com -->
<div id="templatemo_container">
  <div id="templatemo_menu">
      <ul>
                  <li><%= link_to "Home", root_url() %></li>
                  <li class="cart-detail"><%= link_to_cart %></li>
                  <% if current_user%>
                  <li class=<%=link_to_cart.empty? ? "hide_cart" : "" %>><a href="/account">My Account</a></li>
                  <%else%>
                  <li class=<%=link_to_cart.empty? ? "hide_cart" : "" %>><a href="/signup">Register</a></li>
                  <%end%>
                  <% if current_user%>
                  <li>&nbsp;<a href="/user/logout">Logout</a></li>
                  <%else%>
                  <li>&nbsp;<a href="/login">Log In</a></li>
                  <%end%>
      </ul>
    </div> <!-- end of menu -->

    <div id="templatemo_header">
      <div class="product-search">
              <h4>Product Search</h4>
              <div class="prod-search-form">
                          <% @taxons = @taxon && @taxon.parent ? @taxon.parent.children : Spree::Taxon.roots  %>
                <%= form_tag products_url, :method => :get,:class=>"clearfix" do %>
                  <div class="sfield">
                    <%= select_tag :taxon,options_for_select([[t(:all_departments), '']] + @taxons.map {|t| [t.name, t.id]},@taxon ? @taxon.id : params[:taxon]),:class=>"product-select"%>
                  </div>
                  <div class="sfield">
                    <%= text_field_tag :keywords, params[:keywords],:class=>"search_input" %>
                  </div>
                  <div class="sbutton">
                    <%= submit_tag 'Ok', :name => nil,:class=>"sbtn-submit" %>
                  </div>
                <% end %>
              </div>
            </div>
    </div> <!-- end of header -->

    <div id="templatemo_content">
        <div id="templatemo_content_left">
          <div class="templatemo_content_left_section">
        <% if content_for?(:sidebar) %>
          <aside id="sidebar" class="columns alpha four" data-hook>
            <%= yield :sidebar %>
          </aside>
        <% end %>

            </div>


        </div> <!-- end of content left -->

        <div id="templatemo_content_right">

                      <%= breadcrumbs(@taxon) if @taxon %>
                <% if flash.notice %>
                  <div class="flash notice"><%= flash.notice %></div>
                <% end %>
                <% if flash[:error] %>
                  <div class="flash errors"><%= flash[:error] %></div>
                <% end %>
                <%= yield %>


        </div> <!-- end of content right -->

      <div class="cleaner_with_height">&nbsp;</div>
    </div> <!-- end of content -->

    <div id="templatemo_footer">

       <p class="copy-rights">Copyright  <a href="http://www.railsfactory.com/" target="_blank">Railsfactory</a>, 2012. All Rights Reserved</p></div>
    <!-- end of footer -->
<!--  Free CSS Template www.templatemo.com -->
</div> <!-- end of container -->
</body>})
