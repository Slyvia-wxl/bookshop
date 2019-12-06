<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/font-awesome.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/cart/cart.css'/>"> 
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/book/cart.js'/>"></script>

  </head>
  <body>
  <iframe frameborder="0" src="<c:url value='/CategoryServlet?method=findAll'/>" width="100%" height="100%" name="top"></iframe>
<c:choose>
	<c:when test="${empty cartItemList }">
	<div class="cart_info">
	<div class="container">
			<div class="row">
				<div class="col">
					<!-- Column Titles -->
					<div class="cart_info_columns clearfix">
						<div class="cart_info_col cart_info_col_selectAll">
							<input type="checkbox" id="selectAll" checked="checked"/><label for="selectAll">全选</label>
						</div>
						<div class="cart_info_col cart_info_col_product">商品</div>
						<div class="cart_info_col cart_info_col_price">单价</div>
						<div class="cart_info_col cart_info_col_quantity">数量</div>
						<div class="cart_info_col cart_info_col_total">小计</div>
						<div class="cart_info_col cart_info_col_control">操作</div>
					</div>
				</div>
			</div>
		<table class="emptycar" cellpadding="0" cellspacing="0">
			<tr>
				<td align="right">
					<img align="top" src="<c:url value='/images/icon_empty.png'/>"/>
				</td>
				<td>
					<span class="spanEmpty">您的购物车中暂时没有商品</span>
				</td>
			</tr>
		</table>
	</div> 
	</div>
	</c:when>
	<c:otherwise>
	
<!-- Cart Info -->

	<div class="cart_info">
		<div class="container">
			<div class="row">
				<div class="col">
					<!-- Column Titles -->
					<div class="cart_info_columns clearfix">
						<div class="cart_info_col cart_info_col_selectAll">
							<input type="checkbox" id="selectAll" checked="checked"/><label for="selectAll">全选</label>
						</div>
						<div class="cart_info_col cart_info_col_product">商品</div>
						<div class="cart_info_col cart_info_col_price">单价</div>
						<div class="cart_info_col cart_info_col_quantity">数量</div>
						<div class="cart_info_col cart_info_col_total">小计</div>
						<div class="cart_info_col cart_info_col_control">操作</div>
					</div>
				</div>
			</div>
			<div class="row cart_items_row">
				<div class="col">

<c:forEach items="${cartItemList }" var="cartItem">
					<!-- Cart Item -->
					<div class="cart_item d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">
						<div class="cart_item_select">
							<input value="${cartItem.cartItemId }" type="checkbox" name="checkboxBtn" checked="checked"/>
						</div>
						<!-- Name -->		
						<div class="cart_item_product d-flex flex-row align-items-center justify-content-start">						
							<div class="cart_item_image">
								<div><img src="<c:url value='/${cartItem.book.image_b }'/>"></div>
							</div>
							<div class="cart_item_name_container">
								<div class="cart_item_name"><a href="#">${cartItem.book.bname }</a></div>
							</div>
						</div>
						<!-- Price -->
						<div class="cart_item_price">${cartItem.book.currPrice }</div>
						<!-- Quantity -->
						<div class="cart_item_quantity">
							<div class="product_quantity_container">
								<div class="product_quantity clearfix">
									<span>Qty</span>
									<input id="${cartItem.cartItemId }Quantity" type="text" pattern="[0-9]*" value="${cartItem.quantity }">
									<div class="quantity_buttons">
										<div id="quantity_inc_button" class="quantity_inc quantity_control">
											<a class="jia" id="${cartItem.cartItemId }Jia"><i class="fa fa-chevron-up" aria-hidden="true"></i></a>
										</div>
										<div id="quantity_dec_button" class="quantity_dec quantity_control">
											<a class="jian" id="${cartItem.cartItemId }Jian"><i class="fa fa-chevron-down" aria-hidden="true"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Total -->
						<div class="cart_item_total" id="${cartItem.cartItemId }Subtotal">${cartItem.subtotal }</div>
					<!-- control -->
						<a class="cart_item_control" href="<c:url value='/CartItemServlet?method=batchDelete&cartItemIds=${cartItem.cartItemId }'/>">删除</a>
					</div>
</c:forEach>
				</div>
			</div>
			<div class="row row_cart_buttons">
				<div class="col">
					<div class="cart_buttons d-flex flex-lg-row flex-column align-items-start justify-content-start">
						<div class="button continue_shopping_button"><a href="javascript:history.go(-2)">继 续 购 物</div>
						<div class="cart_buttons_right ml-lg-auto">
							<div class="button clear_cart_button"><a href="javascript:batchDelete();">批 量 删 除</a></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row row_extra">
				<div class="col-lg-12">
					<div class="cart_total">
						<div class="section_title">总 计</div>
						<div class="section_subtitle">Cart total</div>
						<div class="cart_total_container">
							<ul>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div id="total" class="cart_total_value ml-auto"></div>
								</li>
							</ul>
						</div>
						<div class="button checkout_button"><a href="javascript:jiesuan();" id="jiesuan" href="#">提 交 订 单</a></div>
					</div>
				</div>
			
		</div>		
	</div>

	<form id="jieSuanForm" action="<c:url value='/CartItemServlet'/>" method="post">
		<input type="hidden" name="cartItemIds" id="cartItemIds"/>
		<input type="hidden" name="total" id="hiddenTotal"/>
		<input type="hidden" name="method" value="loadCartItems"/>
	</form>
	
	</c:otherwise>
</c:choose>	
  </body>
</html>
