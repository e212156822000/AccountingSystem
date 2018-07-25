$(document).ready(function(){
	//公司、受款人的下拉選單
	$('#recorder_id, #company_id' ).chosen({width: "100%"});
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
	//最一開始就設定匯款對象為公司
	$("#purchase_requisition_remit_infos_name").attr("value", $("#company_id option:selected").text());
	//有改動公司名稱時，就設定匯款對象為公司
	$("#company_id").change(function(){
		$("#purchase_requisition_remit_infos_name").attr("value" , $("#company_id option:selected").text())
	});
	//勾選“同記錄人”時，變換值
	$(document).on("click", "#payee_type" , function() {
		var url = "";
		if($("#payee_type").is(":checked")){
			$("#purchase_requisition_remit_infos_name").val($("#recorder_id option:selected").text())
			url = "/employees/"+ $("#recorder_id option:selected").val(); // employees/:id
		}else{
			$("#purchase_requisition_remit_infos_name").val($("#company_id option:selected").text())
			url = "/companies/"+ $("#company_id option:selected").val(); // companies/:id
		}
		//去url中，抓取對應的資料
		$.ajax({
			url: url,
			method: "GET",
			dataType: "json",// url.json 
			data:{ 
			},
			success: function(msg){
				//將msg顯示到前端
				$("#purchase_requisition_remit_infos_bank_name").val(msg["bank_name"]);
				$("#purchase_requisition_remit_infos_bank_code").val(msg["bank_code"]);
				$("#purchase_requisition_remit_infos_branch_bank_code").val(msg["branch_bank_code"]);
				$("#purchase_requisition_remit_infos_account_number").val(msg["account_number"]);
			}
		});
	});
});


function setTotalPrice(){
	if( $("#purchase_requisition_unit_price").val() &&
		$("#purchase_requisition_amount").val() )
	{
		var total_price = parseFloat($("#purchase_requisition_unit_price").val()) * parseFloat($("#purchase_requisition_amount").val());
    	$("#purchase_requisition_total_price").val(total_price.toFixed(3));
    }
}
