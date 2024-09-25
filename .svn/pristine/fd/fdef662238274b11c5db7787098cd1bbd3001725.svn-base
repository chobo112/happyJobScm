<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>반품 이력</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript" src="${CTX_PATH}/js/view/scm/dateCheck/dateCheck.js"></script>
<script type="text/javascript" src="${CTX_PATH}/js/view/scm/callAjaxJson/callAjaxJson.js"></script>
<script type="text/javascript">

var pageSize = 5;
var pageBlockPage = 10;

$(function() {
	returnList()
	dateSetting()
	registerBtnEvent()
})

function registerBtnEvent(){
		$("#searchBtn").click(function(e){
			e.preventDefault();
			returnList();
		});
}

function returnList(cpage) {
	cpage = cpage || 1;
	
	var param = {
			cpage: cpage,
			pageSize: pageSize,
			startDate: $("#startDate").val(),
			endDate: $("#endDate").val()
	}
	
	var callback = function(data) {
		$("#returnList").empty().append(data)
		
		var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "orderList")
		$("#pagingNavi").empty().append(pagieNavigateHtml);
		$("#currentPage").val(cpage);
	}
	
	callAjaxJson("/mypage/returnHistory.do", "POST", true, param, callback)
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
							<span class="btn_nav bold">반품내역</span> 
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>
						
						<p class="conTitle">
							<span>반품내역</span> 
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
						              <th scope="col">반품신청일</th>
						              <th scope="col">반품완료일</th>
									</tr>
								</thead>
								
								<tbody id="returnList"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingNavi"></div>
							
						</div> 
						
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>