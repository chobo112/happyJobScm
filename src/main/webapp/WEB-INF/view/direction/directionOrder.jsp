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
	$(function(){
		orderSearch();
	})
    
	// 전역변수 => 페이징처리 할거라면..
    var cpage = 1;
    var pageSize = 10;

		
	//검색버튼을 눌렀을때
	function orderSearch() {
		$("#searchBtn").click(function(e){
			e.preventDefault();
			
			//전역변수하면 X => 최신입력값을 가져와야하기때문에
			var param = {
						searchCompany : $("#searchCompany").val(),
						searchStDate : $("#searchStDate").val(),
						searchEdDate : $("#searchEdDate").val(),
				};
			
			$.ajax({
				url : "searchOrder",
				method : "post",
				dataType : "json",
				data : JSON.stringify(param),
			    contentType: "application/json; charset=utf-8",
	            success: function(response) {
	                console.log("AJAX 응답 데이터: ", response);
	                //alert("검색결과를 잘 불러왔습니다.");
	                OrderResults(response.searchOrder);
	            },
	            error: function(xhr, status, error) {
	                console.error("AJAX 요청 실패: ", error);
	            }
	        });
		})
	}
	
	
	// 	검색조건에 맞게 불러와서 테이블 만들기
	function OrderResults(orderList) {
	    var tableBody = $("#orderList");
	    
	    // 테이블 본문을 초기화
	    tableBody.empty();
	    
	    if (orderList.length === 0) {
	        // 데이터가 없는 경우 메시지 추가
	        tableBody.append("<tr><td colspan='5'>데이터가 없습니다.</td></tr>");
	    } else {
	        // 데이터가 있는 경우 테이블 행 추가
	        $.each(orderList, function(index, order) {
	            var row = "<tr>"
	                + "<td>" + order.item_code + "</td>"
	                + "<td>" + order.item_name + "</td>"
	                + "<td>" + order.order_company + "</td>"
	                + "<td>" + order.order_date + "</td>"
	                + "<td>" + order.order_count + "</td>"
	                + "</tr>";
	            tableBody.append(row);
	        });
	    }
	}

	
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
          
	
	//유효성검사 => 실행시 => event 체인지 인 경우에 나오도록
	$(document).ready(function() {
	    $("#searchEdDate").on("change", validateDateRange);
	});
            
                
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
						    <span>발주지시서</span> 
						    <span class="fr"> 
						        <!-- 드롭다운 메뉴 추가 시작
						        <div class="dropdown" style="display:inline-block; margin-right: 10px;">
						            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true" style="height: 25px;">
						                기업선택
						                <span class="caret"></span>
						            </button>
						            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
						                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">삼성</a></li>
						                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">네이버</a></li>
						            </ul>
						        </div>
						        드롭다운 메뉴 추가 끝 -->
						        발주업체
						        <input type="text" id="searchCompany" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
						        기간
						        <input type="date" id="searchStDate" name="searchStDate" style="height: 25px; margin-right: 10px;"/> 
						        ~ 
						        <input type="date" id="searchEdDate" name="searchEdDate" style="height: 25px; margin-right: 10px;"/>
						  		<a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
						    </span>
						</p>
						
							<Strong class="btn_nav bold">발주 지시서</Strong> 
						
						<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="50px">
						                   <col width="100px">
						                    <col width="60px">
						                   <col width="50px">
						                   <col width="50px">
					                 </colgroup>
								<thead>
									<tr>
							              <th scope="col">제품번호</th>
							              <th scope="col">제품명</th>
							              <th scope="col">발주업체</th>
							              <th scope="col">날짜</th>
							              <th scope="col">수량</th>
									</tr>

								</thead>
								<tbody id="orderList" >
								<c:if test="${not empty orderList}">
									<c:forEach items="${orderList}" var="orderList">
										<tr>
												<td>${orderList.item_code}</td>
												<td>${orderList.item_name}</td>
												<td>${orderList.order_company}</td>
												<td>
												    <fmt:formatDate value="${orderList.order_date}" pattern="yyyy-MM-dd" />
												</td>												
												<td>${orderList.order_count}</td>
										</tr>
									</c:forEach>
								</c:if>
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
