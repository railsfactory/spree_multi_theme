Deface::Override.new(:virtual_path => %q{spree/taxons/_taxon},
                          :name => %q{replace_shared_taxon},
                          :replace => %q{h5.subtaxon-title},
                          :text => %q{<h2><%= link_to taxon.name, seo_url(taxon), :class => 'breadcrumbs' %></h2>})
