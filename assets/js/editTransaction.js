/**
 * File : editTransaction.js 
 * 
 * This file contain the validation of edit transaction form
 * 
 * @author Harry Agustiana
 */
$(document).ready(function(){
	
	var editTransactionForm = $("#editTransaction");
	
	var validator = editTransactionForm.validate({
		
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