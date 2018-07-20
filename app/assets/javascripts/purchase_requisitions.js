$(document).ready(function(){
	//公司、受款人等的下拉選單
	$('#recorder_id').chosen({width: "95%"});
	//全選、取消全選
	$("#checkAll").click(function () {
	    $(".check").prop('checked', $(this).prop('checked'));
	});
	//填完單價或數量就計算總金額
	$("#purchase_requisition_unit_price").blur(function(){
		setTotalPrice();
	});
	//填完單價或數量就計算總金額
	$("#purchase_requisition_amount").blur(function(){
		setTotalPrice();
	});
	//剛填完公司名稱時，就設定匯款對象為公司
	$("#company_name").blur(function(){
		$("#purchase_requisition_remit_infos_name").val($("#company_name").val())
	});
	//勾選“同記錄人”時，變換值
	$(document).on("click", "#payee_type" , function() {
		var url = "";
		if($("#payee_type").is(":checked")){
			$("#purchase_requisition_remit_infos_name").val($("#recorder_id option:selected").text())
			//url = "/employees/"+
		}else{
			$("#purchase_requisition_remit_infos_name").val($("#company_name").val())
		}
		//抓取對應的資料，等前端可傳payee.id後開工！
		/*
		event.preventDefault();
		$.ajax({
			url: "/employees/"+ id,
			type: "GET",
			data:{ 
				id: $(this).parent().parent().parent().parent().next(".reply_board").prev(".board").attr('id') , edit_comment: $("#edit_textarea_"+ $(this).parent().parent().parent().parent().next(".reply_board").prev(".board").attr('id')).val() 
			},
			success: function(msg){
				var result = $.parseJSON(msg);
				$("#post_text_"+result[0]).html(result[1]);
			}
		});
		*/
	});
	//勾選“同紀錄人”時，抓取對應的資料
	/*
	$(document).on("click", ".edit_submit_button" , function() {
		event.preventDefault();
		$.ajax({
			url: "edit_post.php",
			type: "POST",
			data:{ 
				comment_id: $(this).parent().parent().parent().parent().next(".reply_board").prev(".board").attr('id') , edit_comment: $("#edit_textarea_"+ $(this).parent().parent().parent().parent().next(".reply_board").prev(".board").attr('id')).val() 
			},
			success: function(msg){
				var result = $.parseJSON(msg);
				$("#post_text_"+result[0]).html(result[1]);
							
			}
		});
	});
	*/
});


function setTotalPrice(){
	if( $("#purchase_requisition_unit_price").val() &&
		$("#purchase_requisition_amount").val() )
	{
		var total_price = parseFloat($("#purchase_requisition_unit_price").val()) * parseFloat($("#purchase_requisition_amount").val());
    	$("#purchase_requisition_total_price").val(total_price.toFixed(3));
    }
}
