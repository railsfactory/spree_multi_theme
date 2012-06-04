Deface::Override.new(:virtual_path => %q{spree/users/show},
                          :name => %q{replace_user_show},
                          :replace => %q{#user-info},
                          :text => %q{<div id="user-info"><h4 class="sechead my_acct_hd"><%= t("my_account") %></h4>
                <div class="secinblock">
                  <div class="myacct-edit clearfix">
                    <div class="myacct-label">
                      <label><%= t("email") %>:</label>
                    </div>
                    <div class="myacct-field">
                      <a href="mailto:<%= @user.email %>"><%= @user.email %></a>
                    </div>
                    <div class="myacct-edit-field">
                      <%= link_to t('edit'), edit_account_path %>
                    </div>
                  </div>
                </div>
                </div>})
