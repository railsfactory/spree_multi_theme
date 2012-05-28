Deface::Override.new(:virtual_path => %q{spree/shared/_error_messages},
                          :name => %q{replace_shared_error_messages},
                          :replace => %q{#errorExplanation[data-hook]},
                          :text => %q{
<div id="errorExplanation" class="errorExplanation" data-hook>
   <ul>
   <% target.errors.full_messages.each do |msg| %>
     <li><%= msg %></li>
   <% end %>
   </ul>
</div>})
