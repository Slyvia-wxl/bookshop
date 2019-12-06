$(function(){
	showTotal();
	$("#selectAll").click(function(){
		var bool = $("#selectAll").attr("checked");
		setItemCheckBox(bool);
		setJieSuan(bool);
		showTotal();
	});
	$(":checkbox[name=checkboxBtn]").click(function(){
		var all = $(":checkbox[name=checkboxBtn]").length;
		var select = $(":checkbox[name=checkboxBtn][checked=true]").length;
		if(all == select){
			$("#selectAll").attr("checked",true);
			setJieSuan(true);
		}else if(select == 0){
			$("#selectAll").attr("checked",false);
			setJieSuan(false);
		}else{
			$("#selectAll").attr("checked",false);
			setJieSuan(true);
		}
		showTotal();
	});
	
	$(".jian").click(function(){
		var id =  $(this).attr("id").substring(0,32);
		var quantity = $("#" + id + "Quantity").val();
		if(quantity == 1){
			if(confirm("您是否要删除该商品？")){
			location = "/bookshop/CartItemServlet?method=batchDelete&cartItemIds=" + id;
			}
		}else{
			sendUpdateQuantity(id,quantity-1);
		}
	});
	
		$(".jia").click(function(){
		var id =  $(this).attr("id").substring(0,32);
		var quantity = $("#" + id + "Quantity").val();
		sendUpdateQuantity(id,Number(quantity)+1);
	});
});

function sendUpdateQuantity(id,quantity){
	$.ajax({
		async:false,
		cache:false,
		url:"/bookshop/CartItemServlet",
		data:{method:"updateQuantity",cartItemId:id,quantity:quantity},
		type:"POST",
		dataType:"json",
		success:function(result){
			$("#" + id + "Quantity").val(result.quantity);
			$("#" + id + "Subtotal").text(result.subtotal);
			showTotal();
		}
	});
}
function showTotal() {
	var total = 0;
	$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
		var subtotal = Number($("#" + $(this).val() + "Subtotal").text());
		total += subtotal;
	});
	$("#total").text(total.toFixed(2));
}
function setItemCheckBox(bool){
	$(":checkbox[name=checkboxBtn]").attr("checked",bool);
}
function setJieSuan(bool){
	if(bool){
		$("#jiesuan").unbind("click");
	}else{
		$("#jiesuan").click(function(){
			return false;
		})
	}
}
function batchDelete(){
	var cartItemIdArray = new Array();
	$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
		cartItemIdArray.push($(this).val());
	});
	location = "/bookshop/CartItemServlet?method=batchDelete&cartItemIds=" + cartItemIdArray;
}
function jiesuan(){
	var cartItemIdArray = new Array();
	$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
		cartItemIdArray.push($(this).val());
	});
	$("#cartItemIds").val(cartItemIdArray.toString());
	$("#hiddenTotal").val($("#total").text());
	$("#jieSuanForm").submit();
}