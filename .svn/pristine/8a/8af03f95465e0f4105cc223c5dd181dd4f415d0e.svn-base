<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title> 구매내역  </title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript" src="${CTX_PATH}/js/view/scm/callAjaxJson/callAjaxJson.js"></script>
<script type="text/javascript">

var pageSize = 5;
var pageBlockPage = 10;

$(function () {
	orderList()
	dateSetting()
	registerBtnEvent()
	inputNumChk()
})

function registerBtnEvent(){
		$("#searchBtn").click(function(e){
			e.preventDefault();
			orderList();
		});
}

function orderList(cpage) {
	cpage = cpage || 1;
	
	var param = {
			cpage: cpage,
			pageSize: pageSize,
			startDate: $("#startDate").val(),
			endDate: $("#endDate").val()
	};
	
	var callbackFunction = function(data) {
		$("#orderList").empty().append(data);
    	
    	var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "orderList")
		$("#pagingNavi").empty().append(pagieNavigateHtml);
		$("#currentPage").val(cpage);
	}
	
	callAjaxJson("/mypage/orderHistory.do", "POST", true, param, callbackFunction)
}

function returnBtn(seq, btn) {
	var param = {
			seq: seq
	}
	
	var deliveryDate = btn.closest('tr').querySelector('#deliveryDate').innerText 
	
	if(deliveryDate) {
		if(confirm("반품하시겠습니까?") == true) {
			var callback = function(data){
				$("#item_name").val(data.item_name)
	        	$("#manufac").val(data.manufac)
	        	$("#count").val(data.count)
	        	$("#total").val(data.count*data.item_price)
	        	
	        	$("#btnReturn").attr('href', 'javascript:returnModalBtn('+seq+')')
	        	
	        	gfModalPop('#returnModal')
			}			
			
	    	callAjaxJson("/mypage/returnInfo.do", "POST", true, param, callback)
		}
	} else {
		alert("아직 배송 전입니다.")
	}
}

function returnModalBtn(seq) {
	if(inputCheck()) {
		var param = {
				seq: seq,
				refund_bank: $("#refund_bank").val(),
				refund_bank_name: $("#refund_bank_name").val(),
				refund_bank_num: $("#refund_bank_num").val
		}
		
		var callback = function(data) {
			if(data > 0) {
        		alert("반품신청이 완료되었습니다.")
        		
        		gfCloseModal()
        	} else {
        		alert("죄송합니다. 다시 신청해주세요.")
        	}
		}
		
		callAjaxJson("/mypage/orderReturn.do", "POST", true, param, callback)
	}
}

function dateSetting() {
	var today = new Date().toISOString().substring(0, 10)
	
	$("#startDate").val(today)
	$("#endDate").val(today)
}

function dateFormat(type) {
	var changeDate = $("#startDate")
	var day = new Date($("#endDate").val())
	
	switch(type) {
		case "today" :
			dateSetting()
			break;
		case "week" :
			var sevenDaysAgo = new Date(day);
            sevenDaysAgo.setDate(day.getDate() - 7);
            changeDate.val(sevenDaysAgo.getFullYear() + "-" +
                (sevenDaysAgo.getMonth() + 1).toString().padStart(2, '0') + "-" +
                sevenDaysAgo.getDate().toString().padStart(2, '0'));
			break;
		case "month" :
			changeDate.val(day.getFullYear()+"-"
			+(day.getMonth()).toString().padStart(2,'0')+"-"
			+ day.getDate().toString().padStart(2,'0'));
			break;
	}
}

function dateCheck(date) {
	var checkDate = $(date)
	var startDate = new Date($("#startDate").val())
	var endDate = new Date($("#endDate").val())
	
	if(startDate > endDate) {
		alert("날짜를 다시 선택해주세요")
		
		dateSetting()
	}
}

function inputCheck() {
	var bank = $('#refund_bank')
	var name = $('#refund_bank_name')
	var number = $('#refund_bank_num')
	
	if(!$(bank).val() || !$(name).val() || !$(number).val()){
		alert("필수항목을 입력해주세요")
		
		return false;
	}
	
	return true;
}

function inputNumChk() {
	 $("#refund_bank_num").keyup(function() {
         var replace_text = $(this).val().replace(/[^-0-9]/g, '');
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
							<a href="#" class="btn_nav bold">마이페이지</a> 
							<span class="btn_nav bold">구매내역</span> 
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>
						
						<p class="conTitle">
							<span>구매내역</span> 
							<span class="fr">
								<button onclick="dateFormat('today')">오늘</button>
								<button onclick="dateFormat('week')">일주일</button>
								<button onclick="dateFormat('month')">한달</button>
								
								<input type="date" id="startDate" onchange="dateCheck(this)">
								~
								<input type="date" id="endDate" onchange="dateCheck(this)">
								<a class="btnType red" href="" name="searchbtn"  id="searchBtn">
									<span>검색</span>
								</a>
							</span>
						</p>
						
						<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
	                            <colgroup>
					                   <col width="40px">
					                   <col width="40px">
					                   <col width="60px">
					                   <col width="30px">
					                   <col width="30px">
					                   <col width="60px">
					                   <col width="60px">
				                 </colgroup>
								
								<thead>
									<tr>
						              <th scope="col">제품코드</th> 
						              <th scope="col">제품명</th>
						              <th scope="col">주문일자</th>
						              <th scope="col">수량</th>
						              <th scope="col">금액</th>
						              <th scope="col">배송일자</th>
						              <th scope="col">반품신청</th>
									</tr>
								</thead>
								
								<tbody id="orderList"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingNavi"></div>
							
						</div> 
						
					</div>
				</li>
			</ul>
		</div>
	</div>
	
	<div id="returnModal" class="layerPop layerType2" style="width: 600px;">
		<input type="hidden" id="item_code" name="item_code" value="">
		<dl>
			<dt>
				<strong>반품 신청</strong>
				<span class="font_red fr">* 필수항목</span>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>

					<tbody>
						<tr>
							<th scope="row">제품명 </th>
							<td>
								<input type="text" class="inputTxt p100" id="item_name" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<th scope="row">제조사</th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" id="manufac" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<th scope="row">수량</th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="count" id="count" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<th scope="row">환불 가격</th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="total" id="total" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<th scope="row">은행명<span class="font_red">*</span></th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="refund_bank" id="refund_bank" placeholder="은행명을 입력해주세요" />
							</td>
						</tr>
						<tr>
							<th scope="row">송금자명<span class="font_red">*</span></th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="refund_bank_name" id="refund_bank_name" placeholder="송금자명을 입력해주세요"/>
							</td>
						</tr>
						<tr>
							<th scope="row">계좌번호<span class="font_red">*</span></th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="refund_bank_num" id="refund_bank_num" placeholder="계좌번호를 입력해주세요"/>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnReturn" name="btn"><span>반품</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
				<!-- e : 여기에 내용입력 -->
			</dd>
		</dl>
	</div>
</body>
</html>