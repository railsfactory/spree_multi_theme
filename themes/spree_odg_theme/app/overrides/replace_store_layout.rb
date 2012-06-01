Deface::Override.new(:virtual_path => %q{spree/layouts/spree_application},
                          :name => %q{replace_store_layout},
                          :replace => %q{body},
                          :text => %q{
<body class="<%= body_class %>" id="<%= @body_id || 'default' %>" data-hook="body">
    <div class="wrapper">
      <div class="mainwrapper">
        <div class="body-container clearfix">
          <div class="asidepanel">
            <div class="logo" >
              <h1><%= link_to "Home", root_url() %></h1>
            </div>
               <% if content_for?(:sidebar) %>
          <aside id="sidebar" class="columns alpha four" data-hook>
            <%= yield :sidebar %>
          </aside>
        <% end %>
          </div>
          <div class="contpanel">
            <div class="tophead clearfix">
              <div class="cartinfo">
                <ul>
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
              </div>
            </div><!-- top head -->
            <div class="product-search">
              <h4>PRODUCT SEARCH</h4>
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
            </div><!-- product search -->
            <div class="slider">
              <img src="/assets/slider01.jpg" alt="" />
            </div><!-- slider -->
            <div class="collections" >
              <%= breadcrumbs(@taxon) if @taxon %>
                <% if flash.notice %>
                  <div class="flash notice"><%= flash.notice %></div>
                <% end %>
                <% if flash[:error] %>
                  <div class="flash errors"><%= flash[:error] %></div>
                <% end %>
                <%= yield %>
          </div>
          </div>
        </div><!-- body container -->
        <div class="footer">
          <p class="copy-rights">Copyright  <a href="http://www.railsfactory.com/" target="_blank">Railsfactory</a>, 2012. All Rights Reserved</p>
        </div>
      </div>
    </div>
  </body>})
