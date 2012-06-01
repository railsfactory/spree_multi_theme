Deface::Override.new(:virtual_path => %q{spree/checkout/_delivery},
                          :name => %q{replace_checkout_delivery},
                          :replace => %q{legend},
                          :text => %q{<h5 class="subhead"><%= t(:shipping_method) %></h5>})