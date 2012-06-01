Deface::Override.new(:virtual_path => %q{spree/checkout/payment/_gateway},
                          :name => %q{replace_payment_gateway},
                          :replace => %q{code[erb-loud]:contains('image_tag')},
                          :closing_selector => %q{code[erb-loud]:contains('last_name')},
                          :text => %q{
 <h5 class="subhead">Card Details <%= image_tag 'creditcards/creditcard.gif', :id => 'creditcard-image' ,:class=>"card_logos"%></h5>
                              <div class="clearfix"></div>
                              <div class="form_block card_details ">
                                <div class="field_wrap">
                                  <label>Card Number <span class="req">*</span></label>
                                  <div class="input_wrap">
                                  <% param_prefix = "payment_source[#{payment_method.id}]" %>
                                  <% options_hash = Rails.env.production? ? {:autocomplete => "off"} : {} %>
  <%= text_field_tag "#{param_prefix}[number]", '', options_hash.merge(:id => 'card_number', :class => 'txtinput card_no', :size => 19, :maxlength => 19) %>
                                  </div>
                                </div>
  <span id="card_type" style="display:none;">
    ( <span id="looks_like" ><%= t('card_type_is') %> <span id="type"></span></span>
      <span id="unrecognized"><%= t('unrecognized_card_type') %></span>
    )
  </span>
  <div class="field_wrap">
                                  <label>Expiration <span class="req">*</span></label>
                                  <div class="input_wrap">
<%= select_month(0, {:prefix => param_prefix, :field_name => 'month', :use_month_numbers => true,:prompt=>true},{ :class => "txtselect exp_month" })%>
<%= select_year(0, {:prefix => param_prefix, :field_name => 'year', :start_year => Date.today.year, :end_year => Date.today.year + 15,:prompt=>true}, {:class => "txtselect exp_year"}) %>

                                  </div>
                                </div>

<div class="field_wrap">
                                  <label>Card Code <span class="req">*</span></label>
                                  <div class="input_wrap">
                                     <%= text_field_tag "#{param_prefix}[verification_value]", '', options_hash.merge(:id => 'card_code', :class => 'txtinput card_code', :size => 5) %>
                                  </div>
                                  <a href="/content/cvv" target="_blank" onclick="window.open(this.href,'cvv_info','left=20,top=20,width=500,height=500,toolbar=0,resizable=0,scrollbars=1');return false" class="cvv_desc">
    (<%= t("whats_this") %>)
  </a>
                                </div>

<%= hidden_field param_prefix, 'first_name', :value => @order.billing_firstname %>
<%= hidden_field param_prefix, 'last_name', :value => @order.billing_lastname %>

                          })
