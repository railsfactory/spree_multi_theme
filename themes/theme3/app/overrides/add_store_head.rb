Deface::Override.new(:virtual_path => %q{spree/shared/_head},
                          :name => %q{add_store_head},
                          :insert_after => %q{code[erb-loud]:contains('javascript_include_tag')},
                          :text => %q{<%= javascript_include_tag 'jquery.fancybox-1.3.4' %><%= javascript_include_tag 'store/rdr_wishlist' %>})
