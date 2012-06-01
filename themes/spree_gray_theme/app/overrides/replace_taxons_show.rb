Deface::Override.new(:virtual_path => %q{spree/taxons/show},
                          :name => %q{replace_taxons_show},
                          :replace => %q{h3},
                          :text => %q{<h1 class="taxon-title"><%= accurate_title %></h1>})
