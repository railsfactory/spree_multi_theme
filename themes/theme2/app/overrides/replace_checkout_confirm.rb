Deface::Override.new(:virtual_path => %q{spree/checkout/_confirm},
                          :name => %q{replace_checkout_confirm},
                          :replace => %q{legend},
                          :text => %q{<h4 class="sechead"><%= t(@order.state, :scope => :order_state).titleize %></h4> <br />})