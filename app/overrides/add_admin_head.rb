Deface::Override.new(:virtual_path => %q{spree/admin/shared/_head},
                          :name => %q{add_admin_theme},
                          :insert_after => %q{code[erb-loud]:contains('javascript_include_tag')},
                          :text => %q{<script media="screen" src="/assets/admin/load_theme.js?body=1" type="text/javascript"></script>})
