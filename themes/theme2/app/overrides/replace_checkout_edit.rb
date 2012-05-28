Deface::Override.new(:virtual_path => %q{spree/checkout/edit},
                          :name => %q{replace_checkout_edit},
                          :replace => %q{code[erb-loud]:contains('render @order.state')},
                          :text => %q{<%= render @order.state, :form => form , :order => @order %>})
