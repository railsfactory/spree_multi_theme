Deface::Override.new(:virtual_path => %q{spree/shared/_login},
                          :name => %q{remove_user_login},
                          :remove => %q{code[erb-loud]:contains('f.submit')})
