Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "add_theme_tab",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab(:themes, :url => '/admin/themes/new') %>",
                     :disabled => false,
                     :original => '3e847740dc3e7f924aba1ccb4cb00c7b841649e3')
