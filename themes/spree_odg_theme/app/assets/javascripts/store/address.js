$(document).ready(function() {
	//$("#order_ship_address_attributes_state_id").next().next().prop("disabled", true);
	$("#order_bill_address_attributes_country_id").live("click", function()
	{
		if  ($("#order_bill_address_attributes_state_id").next().attr('class')=='error' )
		  $("#order_bill_address_attributes_state_id").next().hide()
		});
  $("#order_ship_address_attributes_country_id").live("click", function(){
     if ($("#order_ship_address_attributes_state_id").next().attr('class')=='error')
		   $("#order_ship_address_attributes_state_id").next().hide() });
			 
});