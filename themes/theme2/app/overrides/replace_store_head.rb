Deface::Override.new(:virtual_path => %q{spree/shared/_head},
                          :name => %q{replace_store_head},
                          :replace => %q{code[erb-loud]:contains('stylesheet_link_tag')},
                          :text => %q{<%= stylesheet_link_tag 'store/style', :media => 'screen' %>})
