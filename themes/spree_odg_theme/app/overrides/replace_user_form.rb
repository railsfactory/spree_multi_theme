Deface::Override.new(:virtual_path => %q{spree/shared/_user_form},
                          :name => %q{replace_user_form},
                          :replace => %q{p},
                          :closing_selector => %q{#password-credentials},
                          :text => %q{
<div class="fm-elements">
                <%= f.label :email, t("email") %>
                <div class="input-wrap">
                <%= f.text_field :email, :class => 'txt-fld'  %>
                    <div class="error"></div>
                </div>
            </div>
 <div class="fm-elements">
                <%= f.label :password, t("password") %>
                <div class="input-wrap">
                  <%= f.password_field :password, :class => 'txt-fld'  %>
                    <div class="error"></div>
                </div>
            </div>

  <div class="fm-elements">
                <%= f.label :password_confirmation, t(:confirm_password) %>
                <div class="input-wrap">
                   <%= f.password_field :password_confirmation, :class => 'txt-fld' %>
                    <div class="error"></div>
                </div>
            </div>
})
