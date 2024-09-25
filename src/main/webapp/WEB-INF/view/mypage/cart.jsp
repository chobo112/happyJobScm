<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title> 장바구니  </title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript" src="${CTX_PATH}/js/view/scm/callAjaxJson/callAjaxJson.js"></script>
<script type="text/javascript">

var totalList = [];
var priceCal = 0;

$(function () {
	cartList()
	BtnEvent()
	checkboxChk()
})

function BtnEvent() {
	$("a[name=btn]").click(function(e) {
		e.preventDefault();
		
		var btnId = $(this).attr("id")
		
		switch(btnId) {
			case "productBuy":
				productBuy();
				break;
		}
	})
}

function cartList() {
	var param = {
			
	}
	
	var callback = function(data) {
		$("#cartList").empty().append(data);
	}
	
	callAjaxJson("/mypage/cartList.do", "POST", true, param, callback)
}

function countCheck(info) {
	var chkbox = $(info).closest('tr').find('.checkbox').attr('id')
	
	info.addEventListener("focusout", function(e) {
		var param = {
				item_code : chkbox,
				obtain_count : e.target.value
		}
		
		if($(info).val() && ($(info).val() > 0)){
			var callback = function(data) {
				var changeTotal = data.item_price * data.count
				var parentsTagName = $(info).closest('tr').children("#total");
				
				parentsTagName.text('');
				parentsTagName.append(changeTotal);
			}
			
			callAjaxJson("/mypage/cartCountChange.do", "POST", true, param, callback)
		} else {
			if(confirm("장바구니에서 삭제하시겠습니까?") == true) {
				cartDelete(chkbox)
			}
		}
	})
}

function checkboxChk(btn) {
	// 전체 선택 & 해제
	$('#selectAll').click(function() {
		var checked = $('#selectAll').is(':checked');
		
		if(checked) {
			$('input:checkbox').prop('checked', true);
			
			if(checked) {
				var checkedBox = $("input[name=checkbox]:checked").length;
				var checkBoxes = $("input[name=checkbox]:checked")
				
				checkBoxes.each(function() {
					if(!totalList.includes(this.id)) {
						totalList.push({item_code: this.id})
					}
				})
			}
		} else {
			$('input:checkbox').prop('checked', false);
			
			totalList.length = 0
			totalList  = []
		}
		
		totalPrice(checked)
	})
	
	// 전체 선택 중 하나라도 해제되면 전체 선택 체크박스 해제
	$("input[name=checkbox]").click(function() {
		var totalChk = $("input[name=checkbox]").length;
		var checkedBox = $("input[name=checkbox]:checked").length;
		
		if(totalChk != checkedBox) {
			$("#selectAll").prop('checked', false);
		} else {
			$("#selectAll").prop('checked', true);
		}
	})
	
	if($(btn).attr('id')!=="selectAll" && !isEmpty(btn)){
		ListAddRemove(btn)
	}
	
	$("#totalPrice").text('')
	$("#totalPrice").append(priceCal)
}

function ListAddRemove(btn) {
	var pushID = $(btn).attr('id')
	var price = btn.closest('tr').querySelector('#total').innerText
	
	if($(btn).is(':checked')) {
		if(!totalList.includes(pushID)) {
			totalList.push({item_code: pushID})
		}
		
		priceCal += parseInt(price, 10)
	} else {
		var removeIndex = totalList.indexOf(pushID, 0)
		
		// totalList.splice(pushID, removeIndex)
		totalList = totalList.filter(function(e) {
			return e !== pushID
		})
		
		priceCal -= parseInt(price, 10)
		
	}
}

function totalPrice(checked) {
	var total = $("td[id=total]")
	
	priceCal = 0
	
	if(checked) {
		total.each(function() {
			priceCal += parseInt(this.innerText, 10)
		})
	}
	
	$("#totalPrice").text('')
	$("#totalPrice").append(priceCal)
}

function productBuy() {
	if(totalList.length > 0) {
		var callback = function(data) {
			alert("결제가 완료되었습니다.")
			
			location.href = "/mypage/order.do";
		}
		
		callAjaxJson("/mypage/productBuy.do", "POST", true, totalList, callback)
	} else {
		alert("결제할 제품이 없습니다.")
	}
}

function cartDelete(item) {
	var param = {
			item_code: $(item).attr('id')
	}
	
	var callback = function(data) {
		
	}
	
	callAjaxJson("/mypage/cartDelete.do", "POST", true, param, callback)
}

// 빈값 체크
function isEmpty(str){
	if(typeof str == "undefined" || str == null || str == "")
		return true;
	else
		return false ;
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
							<a href="#" class="btn_nav bold">마이페이지</a> 
							<span class="btn_nav bold">장바구니</span> 
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>
						
						<p class="conTitle">
							<span>장바구니</span> 
						</p> 
						
						<div class="divCartList">
							<table class="col">
								<caption>caption</caption>
	                            <colgroup>
					                   <col width="10px">
					                   <col width="20px">
					                   <col width="50px">
					                   <col width="60px">
					                   <col width="20px">
					                   <col width="60px">
					                   <col width="10px">
				                 </colgroup>
								<thead>
									<tr>
						              <th scope="col"><input type="checkbox" id="selectAll" onchange="checkboxChk(this)"></th>
						              <th scope="col">장비구분</th> 
						              <th scope="col">제품명</th>
						              <th scope="col">제조사</th>
						              <th scope="col">수량</th>
						              <th scope="col">가격</th>
						              <th scope="col"></th>
									</tr>
								</thead>
								<tbody id="cartList"></tbody>
							</table>
						</div>
						
						<div class="btn_areaC mt30">
							<span class="font19">결제 금액:</span>
							<span class="font19 ml10" id="totalPrice">0</span>
							<a href="" class="btnType blue ml20" id="productBuy" name="btn">
								<span>결제하기</span>
							</a> 
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>