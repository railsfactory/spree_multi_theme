Deface::Override.new(:virtual_path => %q{spree/users/edit},
                          :name => %q{remove_user_edit},
                          :sequence => {:before => 'replace_user_edit'},
                          :remove => %q{code[erb-loud]:contains('f.submit')})
