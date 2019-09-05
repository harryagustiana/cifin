/**
 * File : addTransaction.js
 * 
 * This file contain the validation of add transaction form
 * 
 * Using validation plugin : jquery.validate.js
 * 
 * @author Harry Agustiana
 */

$(document).ready(function(){
	
	var addTransactionForm = $("#addTransaction");
	
	var validator = addTransactionForm.validate({
		
		rules:{
			name :{ required : true },
			description : { required : true },
			amount : { required : true, digits : true },
			type : {required : true },
			transDate : { required : true },
		},
		messages:{
			name :{ required : "This field is required" },
			description : { required : "This field is required" },
			amount : { required : "This field is required", digits : "Please enter numbers only" },
			type : {required : "This field is required" },
			transDate : { required : "This field is required" }			
		}
	});
});
