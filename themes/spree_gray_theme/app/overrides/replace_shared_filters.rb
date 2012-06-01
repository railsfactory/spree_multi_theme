Deface::Override.new(:virtual_path => %q{spree/shared/_filters},
                          :name => %q{replace_shared_filters},
                          :replace => %q{.navigation},
                          :text => %q{
<div class="navigation" data-hook="navigation">
  <h6 class="taxonomy-root"> <%= filter[:name] %> </h6>
  <ul class="filter_choices inner-list">
    <% labels.each do |nm,val| %>
      <% label = "#{filter[:name]}_#{nm}".gsub(/\s+/,'_') %>
      <li class="nowrap chckbox-wrap">
        <input type="checkbox"
         id="<%= label %>"
         name="search[<%= filter[:scope].to_s %>][]"
         value="<%= val %>"
         <%= params[:search][filter[:scope]] && params[:search][filter[:scope]].include?(val.to_s) ? "checked" : "" %> />
        <label class="nowrap" for="<%= label %>"> <%= nm %> </label>
      </li>
    <% end %>
  </ul>
</div>})
