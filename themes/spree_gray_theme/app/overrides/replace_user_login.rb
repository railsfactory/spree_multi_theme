Deface::Override.new(:virtual_path => %q{spree/shared/_login},
                          :name => %q{replace_user_login},
                          :replace => %q{code[erb-loud]:contains('form_for')},
                          :closing_selector => %q{p},
                          :text => %q{
<% if flash[:alert] %>
  <%= flash[:alert] %>
<% end %>
<%= form_for(:user, :url => user_session_path,:novalidation=>"novalidation") do |f| %>
    <div class="fm-elements">
        <%= f.label(:email, t("email")) %>
       <div class="input-wrap">
      <%= f.text_field('email', :class => 'txt-fld',:maxlength=>50) %>
   <div class="error"></div>
       </div>
    </div>
     <div class="fm-elements">
        <%= f.label :password, t("password") %>
   <div class="input-wrap">
      <%= f.password_field 'password', :class => 'txt-fld' ,:maxlength=>50%>
<div class="error"></div>
                </div>
            </div>
  <div class="fm-elements">
  <%= f.check_box :remember_me ,:class=>"check-box"  %>
                   <p><%= f.label :remember_me, t('remember_me') %></p>
            </div>
  <div class="fm-elements">

  <%= submit_tag ("login"), :class => 'button primary'%>
</div>})
