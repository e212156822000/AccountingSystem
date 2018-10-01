var remit_infos_temp;
$(document).ready(function(){
	//***************** 請購單主頁 ************************//

	//全選、取消全選
	$("#checkAll").click(function () {
	    $(".check").prop('checked', $(this).prop('checked'));
	});
	//勾選時時，就更改value值
	$(".check").change(function(){
		var deleteIDs = [];
		$(".check:checked").map(function(){
   	  		deleteIDs.push($(this).val());
   		});
   		$("#deleteIds").val(deleteIDs);
	})
	//點了按鈕即取出checkbox中點選的id值
	//Ａ方法是js攔截，抓好ids後，redirect url過去
	$('#action_btn').click(function(){
		event.preventDefault();
		var deleteIDs = [];
		$(".check:checked").map(function(){
   	  		deleteIDs.push($(this).val());
   		});
   		$("#deleteIds").val(deleteIDs);
	});
	//Ｂ方法是直接更改mehtod，讓rails去接params[]
	// $("#action").change(function(){
	// 	$("#action_form").append('<input type="hidden" value='+ $("#action option:selected").val() +' name="_method">')
	// 	$("#action_form").attr("action" , "/purchase_requisitions/delete_all/")
	// });

	//***************** 新增請購單 ************************//
	
	//公司、受款人的下拉選單
	$('#recorder_id, #company_id').chosen({width: "100%"});
	//填完單價或數量就計算總金額
	$("#purchase_requisition_unit_price, #purchase_requisition_amount").blur(function(){
		setTotalPrice();
	});
	//最一開始先設定匯款對象為公司
	getRemitInfos();
	//有改動公司名稱時，若payee_type是“不勾選同紀錄人”時，就更新匯款資料
	//有改動員工名稱時，若payee_type是“勾選同紀錄人”時，就更新匯款資料
	$("#company_id, #recorder_id").change(function(){
		getRemitInfos();
	});
	//有改動帳戶名稱時，更改成對應的銀行代碼、分行名稱、帳號等
	$("#purchase_requisition_remit_infos_bank_name").change(function(){
		var msg = remit_infos_temp;
		var i = parseInt($("#purchase_requisition_remit_infos_bank_name option:selected").val())
		$("#purchase_requisition_remit_infos_bank_code").val(msg[i]["bank_code"]);
		$("#purchase_requisition_remit_infos_branch_bank_code").val(msg[i]["branch_bank_code"]);
		$("#purchase_requisition_remit_infos_account_number").val(msg[i]["account_number"]);
	})
	//勾選“同記錄人”時，變換值
	$(document).on("click", "#payee_type" , function() {
		getRemitInfos();
	});
	//訂金欄位一開始要隱藏，選擇到「事先付款」後才顯示。
	$("#purchase_requisition_deposit_price").hide();
	$("label[for='purchase_requisition_deposit_price']").hide()
	$(".purchase_requisition_payment_term").change(function(){
		if($(".purchase_requisition_payment_term option:selected").text() == "事先付款"){
			$("#purchase_requisition_deposit_price").show();
			$("label[for='purchase_requisition_deposit_price']").show()
		}else{
			$("#purchase_requisition_deposit_price").hide();
			$("label[for='purchase_requisition_deposit_price']").hide()
		}
	});

});

//非同步抓取匯款資訊
function getRemitInfos() {
	//判斷勾選狀態，決定要抓公司or員工的匯款資料
  	var url = "";
	if($("#payee_type").is(":checked")){
		$("#purchase_requisition_remit_infos_name").val($("#recorder_id option:selected").text())
		url = "/employees/"+ $("#recorder_id option:selected").val(); // employees/:id
	}else{
		$("#purchase_requisition_remit_infos_name").val($("#company_id option:selected").text())
		url = "/companies/"+ $("#company_id option:selected").val(); // companies/:id
	}
	//去url中，抓取對應的匯款資料
	$.ajax({
		url: url,
		method: "GET",
		dataType: "json",// url.json 
		data:{ 
		},
		success: function(msg){
			remit_infos_temp = msg;
			//將msg顯示到前端
			//清空之前的選項
			$("#purchase_requisition_remit_infos_bank_name").empty();
			var i;
			//處理多個可能的匯款資訊
			for(i = 0; i < msg.length; i++){
				$("#purchase_requisition_remit_infos_bank_name").append($('<option>', {value: i, text: msg[i]["bank_name"] }));
			}
			//預設第一個匯款資訊，若重新選擇帳戶名稱，會更改
			$("#purchase_requisition_remit_infos_bank_code").val(msg[0]["bank_code"]);
			$("#purchase_requisition_remit_infos_branch_bank_code").val(msg[0]["branch_bank_code"]);
			$("#purchase_requisition_remit_infos_account_number").val(msg[0]["account_number"]);
		}
	});
}

//計算總金額
function setTotalPrice(){
	if( $("#purchase_requisition_unit_price").val() &&
		$("#purchase_requisition_amount").val() )
	{
		var total_price = parseFloat($("#purchase_requisition_unit_price").val()) * parseFloat($("#purchase_requisition_amount").val());
    	$("#purchase_requisition_total_price").val(total_price.toFixed(3));
    }
}
