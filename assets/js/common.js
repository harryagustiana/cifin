/**
 * @author Harry Agustiana
 */


jQuery(document).ready(function(){
	
	jQuery(document).on("click", ".deleteUser", function(){
		var userId = $(this).data("userid"),
			hitURL = baseURL + "deleteUser",
			currentRow = $(this);
		
		var confirmation = confirm("Apakah anda yakin ingin menghapus pengguna ini ?");
		
		if(confirmation)
		{
			jQuery.ajax({
			type : "POST",
			dataType : "json",
			url : hitURL,
			data : { userId : userId } 
			}).done(function(data){
				console.log(data);
				currentRow.parents('tr').remove();
				if(data.status = true) { alert("Pengguna berhasil dihapus"); }
				else if(data.status = false) { alert("Pengguna gagal dihapus"); }
				else { alert("Access denied..!"); }
			});
		}
	});

	jQuery(document).on("click", ".deleteTransaction", function(){
		var id = $(this).data("id"),
			hitURL = baseURL + "deleteTransaction",
			currentRow = $(this);
		
		var confirmation = confirm("Apakah anda yakin ingin menghapus transaksi ini ?");
		
		if(confirmation)
		{
			jQuery.ajax({
			type : "POST",
			dataType : "json",
			url : hitURL,
			data : { id : id } 
			}).done(function(data){
				console.log(data);
				currentRow.parents('tr').remove();
				if(data.status = true) { alert("Transaksi berhasil dihapus"); }
				else if(data.status = false) { alert("Transaksi gagal dihapus"); }
				else { alert("Access denied..!"); }
			});
		}
	});
	
	
	jQuery(document).on("click", ".searchList", function(){
		
	});
	
});
