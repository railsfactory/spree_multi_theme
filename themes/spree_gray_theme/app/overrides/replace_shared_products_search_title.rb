Deface::Override.new(:virtual_path => %q{spree/shared/_products},
                          :name => %q{replace_shared_products_search_title},
                          :replace => %q{h6},
                          :text => %q{<h4 class="search-results-title sechead"><%= t(:search_results, :keywords => h(params[:keywords])) %></h4>})
