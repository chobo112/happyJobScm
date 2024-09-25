<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title> 제품  </title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript" src="${CTX_PATH}/js/view/scm/callAjaxJson/callAjaxJson.js"></script>
<script type="text/javascript">

var pageSize = 5;
var pageBlockPage = 10;

$(document).ready(function() {
	priceCheck();
})

$(function () {
	productSearch();
	BtnEvent();
	inputNumChk();
})

function BtnEvent() {
	$("#searchBtn").click(function(e){
		e.preventDefault();
		productSearch();
	});
	
	$("a[name=btn]").click(function(e) {
		e.preventDefault();
		
		var btnId = $(this).attr("id");
		
		switch(btnId) {
			case "btnCart":
				productCart();
				break;
			case "btnClose":
				gfCloseModal();
				break;
			case "btnPay":
				pay();
				break;
		}
	})
}

function productSearch(cpage) {
	cpage = cpage || 1;
	
	var param = {
			search_type : $("#searchType").val(),
			search_title : $("#searchTitle").val(),
			cpage : cpage,
			pageSize: pageSize
	};
	
	var callback = function(data) {
		$("#productList").empty().append(data);
    	
    	var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "productSearch")
		$("#pagingNavi").empty().append(pagieNavigateHtml);
		$("#currentPage").val(cpage);
	}
	
	callAjaxJson("/product/productList.do", "POST", false, param, callback)
}

function productDetailModal(code) {
	var param = {
			item_code : code
	};
	
	var callback = function(data) {
		var info = data.productInfo;
    	
    	$("#item_name_detail").val(info.item_name);
    	$("#equipment_type_detail").val(info.equipment_type);
    	$("#item_price_detail").val(info.item_price);
    	$("#product_detail").val(info.product_detail);
    	$("#manufac").val(info.manufac);
    	
    	gfModalPop("#productDetailModal")
	}
	
	callAjaxJson("/product/productDetail.do", "POST", true, param, callback)
}

function productBuy(code) {
	$("#count").val("")
	$("#total").val("")
	
	var param = {
			item_code : code
	};
	
	var callback = function(data) {
		var info = data.productInfo;
    	
    	$("#item_code").val(info.item_code);
    	$("#item_name_buy").val(info.item_name);
    	$("#equipment_type_buy").val(info.equipment_type);
    	$("#product_buy").val(info.product_detail);
    	$("#manufac_buy").val(info.manufac);
    	$("#item_price_buy").val(info.item_price);
    	
    	gfModalPop("#buyModal")
	}
	
	callAjaxJson("/product/productDetail.do", "POST", true, param, callback)
}

function pay() {
	var count = $("#count").val()
	
	
	if(count > 0) {
		var param = {
				item_code : $("#item_code").val(),
				count : $("#count").val()
		};
		
		var callback = function(data) {
			alert("결제가 완료되었습니다.")
        	
        	gfCloseModal();
        	
        	if(confirm("쇼핑을 계속 하시겠습니까?") == false) {
	        	window.location.href = "/mypage/order.do"
        	}
		}
		
		callAjaxJson("/product/productPay.do", "POST", true, param, callback)
	} else {
		alert("수량을 입력해주세요.")
	}
}

function productCart() {
	var count = $("#count").val()
	
	if(count > 0) {
		var param = {
				item_code : $("#item_code").val(),
				obtain_count : $("#count").val()
		}
		
		var callback = function(data) {
			alert("상품이 장바구니에 담겼습니다.")
        	
        	gfCloseModal();
		}
		
		callAjaxJson("/product/productCart.do", "POST", true, param, callback)
	} else {
		alert("수량을 입력해주세요")
	}
	
}

function priceCheck() {
	$("#count").on("propertychange change paste input", function () {
		var count = $("#count").val();
		var price = $("#item_price_buy").val();
		
		$("#total").val(count * price)
	})
}

function inputNumChk() {
	console.log("수량체크")
	
	 $("#count").keyup(function() {
        var replace_text = $(this).val().replace(/[^0-9]/g, '');
        $(this).val(replace_text);
    });
}
</script>
</head>
<body>
<input type="hidden" id="currentPage" value="">  <!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
	<input type="hidden" name="action" id="action" value=""> 
	<div id="wrap_area">
		<h2 class="hidden">header 영역</h2> 
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> 
					<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">
						<p class="Location">
							<a href="#" class="btn_set home">메인으로</a> 
							<a href="#" class="btn_nav bold">제품</a> 
							<span class="btn_nav bold">전체</span> 
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>
						
						<p class="conTitle">
							<span>제품</span> 
							<span class="fr">
							<select name="" id="searchType">
								<option value="item_name">제품명</option>
								<option value="equipment_type">장비</option>
								<option value="manufac">제조사</option>
							</select>
	                          <input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
							  <a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
							</span>
						</p> 
						
						<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="50px">
						                   <col width="60px">
						                   <col width="60px">
						                   <col width="60px">
						                   <col width="30px">
					                 </colgroup>
								<thead>
									<tr>
							              <th scope="col">장비구분</th> 
							              <th scope="col">제품명</th>
							              <th scope="col">제조사</th>
							              <th scope="col">가격</th>
							              <th scope="col"></th>
									</tr>
								</thead>
								<tbody id="productList"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingNavi">
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 모달팝업 -->
	<div id="productDetailModal" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>제품 상세정보</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>

					<tbody>
						<tr>
							<th scope="row">제품명 </th>
							<td>
								<input type="text" class="inputTxt p100" name="item_name_detail" id="item_name_detail" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<th scope="row">장비구분</th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="equipment_type_detail" id="equipment_type_detail" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<th scope="row">가격</th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="item_price_detail" id="item_price_detail" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<th scope="row">제품정보</th>
							<td colspan="3">
								<textarea class="inputTxt p100" name="product_detail" id="product_detail" disabled>
								</textarea>
							</td>
						</tr>
						<tr>
							<th scope="row">제조사</th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="manufac" id="manufac" readonly="readonly"/>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	
	<div id="buyModal" class="layerPop layerType2" style="width: 600px;">
		<input type="hidden" id="item_code" name="item_code" value="">
		<dl>
			<dt>
				<strong>제품 상세정보</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>

					<tbody>
						<tr>
							<th scope="row">제품명 </th>
							<td>
								<input type="text" class="inputTxt p100" name="item_name_buy" id="item_name_buy" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<th scope="row">장비구분</th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="equipment_type_buy" id="equipment_type_buy" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<th scope="row">제품정보</th>
							<td colspan="3">
								<textarea class="inputTxt p100" name="product_buy" id="product_buy" disabled>
								</textarea>
							</td>
						</tr>
						<tr>
							<th scope="row">제조사</th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="manufac_buy" id="manufac_buy" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<th scope="row">수량</th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="count" id="count" />
							</td>
						</tr>
						<tr>
							<th scope="row">가격</th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="item_price_buy" id="item_price_buy" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<th scope="row">총 가격</th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="total" id="total" readonly="readonly" />
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnPay" name="btn"><span>결제</span></a> 
					<a href="" class="btnType blue" id="btnCart" name="btn"><span>담기</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
				<!-- e : 여기에 내용입력 -->
			</dd>
		</dl>
	</div>
</body>
</html>