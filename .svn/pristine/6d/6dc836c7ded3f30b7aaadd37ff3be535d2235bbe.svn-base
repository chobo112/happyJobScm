<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title> 공지사항  </title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script>

//row 클릭 시 배송지시서 상세보기 모달이 나오도록 설정
/*
$(document).ready(function(){
    $(".clickable-row").click(function(){
        var rowId = $(this).attr('id');
        var orderNumber = $(this).find('.order-number').text();
        var orderDate = $(this).find('.order-date').text();
        var companyName = $(this).find('.company-name').text();
        var orderQuantity = $(this).find('.order-quantity').text();

        $('#modalOrderNumber').val(orderNumber);
        $('#modalOrderDate').val(orderDate);
        $('#modalCompanyName').val(companyName);
        $('#modalOrderQuantity').val(orderQuantity);

        $("#deliveryDetailPop").modal('show');
    });
    // 닫기 버튼 기능
    $("#btnClose").click(function(e){
        e.preventDefault();
        $("#deliveryDetailPop").modal('hide');
    });
});

*/
	var pageSize = 5;
	var pageBlockPage = 10;
	
	// 종료일(EDate) 변경 이벤트 핸들러 등록
	$(document).ready(function() {
	    $("#searchEdDate").on("change", validateDateRange);
	    deliveryList();
	});

	// 날짜 유효성 검사 함수
	function validateDateRange() {
	    let searchStDate = $("#searchStDate").val();
	    let searchEdDate = $("#searchEdDate").val();

	    // 날짜가 선택되지 않았으면 아무 동작도 하지 않음
	    if (!searchStDate || !searchEdDate) {
	        return;
	    }

	    let stDate = new Date(searchStDate);
	    let edDate = new Date(searchEdDate);

	    // 종료일이 시작일보다 이전일 때 경고
	    if (edDate < stDate) {
	        alert("날짜를 다시 선택해주세요.");
	        $("#searchEdDate").val(""); // 잘못된 종료일 입력 필드 초기화
	    }
	}
	
	
	
	//유효성검사 => 실행시 => event 체인지 인 경우에 나오도록
	$(document).ready(function() {
	    $("#searchEdDate").on("change", validateDateRange);
	    $("#searchStDate").on("change", validateDateRange);
	});
          
	
	$(function() {
		deliveryList();
		searchBtnEvent();
	})
	
	function searchBtnEvent() {
		$("#searchBtn").click(function(event){
			event.preventDefault();
			deliveryList();
		})
	}
	
	function deliveryList(cpage) {
		cpage = cpage || 1;

		var param = {
				searchTitle : $("#searchTitle").val(),
				searchStDate : $("#searchStDate").val(),
				searchEdDate : $("#searchEdDate").val(),
				currentPage : cpage,
				pageSize : pageSize
		};
	
		var callBackFunction = function(res) {
			$("#directionDeliveryList").empty().append(res);

			//페이징
			var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "deliveryList");
			$("#pagingNavi").empty().append(pagieNavigateHtml);
			$("#currentPage").val(cpage);
			
		}
	
		callAjax("/direction/directionDeliveryList.do", "post", "text", false, param, callBackFunction);
	}

</script>


</head>
<!-- 작업지시서 => 발주지시서 목록 -->
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
							<a href="#" class="btn_nav bold">시스템 관리</a> 
							<span class="btn_nav bold">공지 사항</span> 
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>
						
						<p class="conTitle">
							<span>배송지시서</span> 
							<span class="fr"> 배송담당자
								<input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
								기간
								<input type="date" id="searchStDate" name="searchStDate" style="height: 25px; margin-right: 10px;"/> 
								~ 
								<input type="date" id="searchEdDate" name="searchEdDate" style="height: 25px; margin-right: 10px;"/>
								<a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
							</span>
						</p> 

							<Strong class="btn_nav bold">배송 지시서</Strong> 
						
						<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="30px">
						                   <col width="90px">
						                   <col width="50px">
						                   <col width="50px">
						                   <col width="100px">
						                   <col width="50px">
						                   <col width="50px">
					                 </colgroup>
								<thead>
									<tr>
							              <th scope="col">배송번호</th>
							              <th scope="col">배송시작일</th>
							              <th scope="col">배송담당자 </th>
							              <th scope="col">출발지 </th>
							              <th scope="col">목적지 </th>
							              <th scope="col">배송개수</th>
							              <th scope="col">배송상태</th>
									</tr>
								</thead>
								<tbody id="directionDeliveryList" class="clickable-row">
								</tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingNavi">
							</div>
											
						</div>

		
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
	
	
</body>
</html>
