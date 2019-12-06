<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">

	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/font-awesome.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/product.css'/>"> 
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/swiper.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/bookimglunbo.css'/>"> 
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.11.3.min.js'/>"></script>
  </head>  
  <body>
  <iframe frameborder="0" src="<c:url value='/CategoryServlet?method=findAll'/>" width="100%" height="100%" name="top"></iframe>
  <div class="product_details">
		<div class="container">
			<div class="row details_row">
				
				<!-- Product Image -->
				<div class="col-lg-6">
					<div class="pc-slide">
			<div class="view">
				<div class="swiper-container">
					<a class="arrow-left" href="#"></a>
					<a class="arrow-right" href="#"></a>
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<a target="_blank"><img src="<c:url value='/${book.image_w }'/>"/></a>
						</div>
						<div class="swiper-slide">
							<a target="_blank"><img src="<c:url value='/${book.image_w }'/>"/></a>
						</div>
					</div>
				</div>
			</div>
			<div class="preview">
				<a class="arrow-left" href="#"></a>
				<a class="arrow-right" href="#"></a>
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide active-nav">
							<img src="<c:url value='/${book.image_b }'/>"/>
						</div>
						<div class="swiper-slide">
							<img src="<c:url value='/${book.image_b }'/>"/>
						</div>
					</div>
				</div>
			</div>
		</div>
				</div>

				<!-- Product Content -->
				<div class="col-lg-6">
					<div class="details_content">
						<div class="details_name">${book.bname }</div>
						<div class="details_discount">￥ ${book.price }</div>
						<div class="details_price">￥ ${book.currPrice }</div>

						<!-- In Stock -->
						<div class="in_stock_container">
							<div class="availability">Availability:</div>
							<span>In Stock</span>
						</div>
						<table class="book_detail">
			<tr>
				<td colspan="3">
					作者：${book.author } 著
				</td>
			</tr>
			<tr>
				<td colspan="3">
					出版社：${book.press }
				</td>
			</tr>
			<tr>
				<td colspan="3">出版时间：${book.publishtime }</td>
			</tr>
			<tr>
				<td>版次：${book.edition }</td>
				<td>页数：${book.pageNum }</td>
				<td>字数：${book.wordNum }</td>
			</tr>
			<tr>
				<td width="180">印刷时间：${book.printtime }</td>
				<td>开本：${book.booksize } 开</td>
				<td>纸张：${book.paper }</td>
			</tr>
		</table>
	
				<!-- Product Quantity -->
					<div class="product_quantity_container">
						<form id="form1" action="<c:url value='/CartItemServlet'/>" method="post">
							<input type="hidden" name="method" value="add"/>
							<input type="hidden" name="bid" value="${book.bid }"/>
							<div class="product_quantity clearfix">
								<span>Qty</span>
								<input id="quantity_input" type="text" pattern="[0-9]*" name="quantity" value="1">
								<div class="quantity_buttons">
									<div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fa fa-chevron-up" aria-hidden="true"></i></div>
									<div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fa fa-chevron-down" aria-hidden="true"></i></div>
								</div>
							</div>	
							<div class="button cart_button"><a href="javascript:$('#form1').submit();">Add to cart</a></div>
						</form>
					</div>

						<!-- Share -->
						<div class="details_share">
							<span>Share:</span>
							<ul>
								<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<c:url value='/jsps/js/book/swiper.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/book/bookimglunbo.js'/>"></script>
  	<script type="text/javascript" src="<c:url value='/jsps/js/book/product.js'/>"></script>
  </body>
  </html>