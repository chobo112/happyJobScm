<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<!-- 부트스트랩 CSS 이거 하면 터짐..
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
-->

<script type="text/javascript">
	//수주리스트 불러오기
	$(function() {
		//밑은 배송에 관한 js
		orderList();
		searchBtnEvent();
		
		$("#btnOrderinsert").click(function() {
			OrderInsert();
	    });
		
		$("#btnOrderUpdate").click(function() {
			findOrderStatus();
		})
		
		$("#btnOrderClose").click(function() {
			gfCloseModal();
		})


	})
	
	function searchBtnEvent() {
		$("#searchBtn").click(function(event){
			event.preventDefault();
			orderList();
		})
	}
	
	
	// AJAX 함수 제이슨, 바디로 제대로 보내주는거
	function callMyAjax(url, method, dataType, async, param, successCallback) {
		//console.log("param : " + param.Storage_item_code)
		
	    $.ajax({
	        url: url,
	        type: method,
	        contentType: "application/json", // JSON 데이터를 보내기 위해 설정
	        dataType: dataType, // 서버로부터 JSON 응답을 받기 위해 설정
	        async: async,
	        data: JSON.stringify(param), // 파라미터를 JSON 문자열로 변환
	        success: function(data) {
	        	successCallback(data)
	        },
	        error: function(xhr, status, error) {
	        	//console.log(param);
	            //console.log("AJAX Error: " + status + error);
	        }
	        
	    });
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
          

	// 종료일(EDate) 변경 이벤트 핸들러 등록
	$(document).ready(function() {
	    $("#searchEdDate").on("change", validateDateRange);
	});

	
	//발주내역 전체 출력해주자(검색까지)
	function orderList() {
		
		let param = {
				searchTitle : $("#searchTitle").val(),
				searchStDate : $("#searchStDate").val(),
				searchEdDate : $("#searchEdDate").val(),
		}
		var callBackFunction = function(res) {
	        $("#orderList").empty(); // 기존 내용을 비움
	        
	        if (res.trim() === "") { // res가 빈 문자열일 경우 .trim으로 잘라줘야됨
	            // 검색 결과가 없을 때 메시지 추가
	            $("#orderList").append('<tr><td colspan="6">검색한 데이터가 존재하지 않습니다.</td></tr>');
	        } else {
	            // 검색 결과가 있을 때, 결과 추가
	            $("#orderList").append(res);
	        }
	    }
		callAjax("/business/orderList.do", "post", "text", false, param, callBackFunction);
	}
	
	//모달창에 누른 행에 대한 값 띄워주기
	function obtainModal(info) {
	    var parentRow = $(info).closest('tr'); // 클릭된 버튼의 부모 행을 찾습니다.
	    
	    var parentRow1 = parentRow.find("#order_seq").text();
	    var parentRow2 = parentRow.find("#order_obtain_date").text();
	    var parentRow3 = parentRow.find("#order_cust_name").text();
	    var parentRow4 = parentRow.find("#order_item_name").text();
	    var parentRow5 = parentRow.find("#order_obtain_count").text();
	    var parentRow6 = parentRow.find("#order_count").text();
	    var parentRow7 = parentRow.find("#order_item_code").text();

	    // 모달에 데이터 설정
	    $("#seq").text(parentRow1);
	    $("#obtain_date").text(parentRow2);
	    $("#cust_name").text(parentRow3);
	    $("#item_name").text(parentRow4);
	    $("#obtain_count").text(parentRow5);
	    $("#order_insert_count").text(parentRow6);
	    $("#item_code").text(parentRow7);
	    
	    console.log($("#item_code").text());
	    console.log($("#obtain_date").text());
	    
	    findIOrderCompany();
	    findOrderStatus();
	    gfModalPop("#orderPop");
	}
	
	//발주회사 찾기 
	function findIOrderCompany() {
		//console.log($("#item_code").text());
		let param = {
				item_code : $("#item_code").text()
		}
	    //console.log("Parameter:", param); // param 객체를 출력하여 확인

		var callBackFunction = function(res) {
	        // 셀렉트 박스를 비움
	        $("#Order_select_Company").empty();
	        $("#Order_select_Company").append('<option value=""></option>');
			
	        // 서버로부터 받은 데이터를 셀렉트 박스에 추가
	        res.forEach(function(getCompanyList) {
	            var option = $("<option></option>")
	                .attr("value", getCompanyList.item_code)
	                .text(getCompanyList.company_name);
	            $("#Order_select_Company").append(option);
	        });
		}
	    callMyAjax("/business/findOrderCompany.do", "POST", "json", true, param, callBackFunction);
	}
	
	//발주지시서 등록 요청 함수
	function OrderInsert() {
	    var data = {
		    item_code : $('#item_code').text(),
		    product_name  : $('#item_name').text(),
		    order_count : $('#order_insert_count').text().trim(),
		    obtain_date : $('#obtain_date').text().trim()
	    };
	   
	    $.ajax({
	        url: '/business/OrderInsert.do', // 실제 서버의 URL
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(data),
	        success: function(response) {
	            if (response === 1) {
	                alert('발주지시서 등록 성공하였습니다.');
	                location.reload(); // 예시로 페이지 리로드
	            } else {
	                alert('발주지시서 등록 실패하였습니다.');
	            }
	        },
	        error: function(xhr, status, error) {
	            alert('발주지시서 등록 실패하였습니다: ');
	        }
	    });
	}
	
	
	// 발주지시서 작성 여부 확인 함수
	function findOrderStatus() {
	    var param = {
	    		item_code : $('#item_code').text(),
			    obtain_date : $('#obtain_date').text().trim()
		    };
		   
	    var callBackFunction = function(res) {
	        console.log("발주지시서 작성 여부 확인:", res);
	
	        // res.status 값에 따라 처리
	        if (res <= 0) {
	            // 작성 가능한 상태
	            $('#btnOrderinsert').show(); // 작성 버튼 보이기
	            //$('#btnOrderUpdate').hide(); // 수정 버튼 숨기기
	        } else {
	            // 수정 가능한 상태
	            $('#btnOrderinsert').hide(); // 작성 버튼 숨기기
	            //$('#btnOrderUpdate').show(); // 수정 버튼 보이기
	        }
	    };
	
	    callMyAjax("/business/findOrderStatus.do", "POST", "json", true, param, callBackFunction);
	}
	
	
	
	
</script>
</head>
<body>
  <form id="myForm" action="" method=""><!--폼으로 전체 감싼거-->

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
						<span>발주현황</span> 
						<span class="fr">
 						  고객기업명<input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
						  기간
                          <input type="date" id="searchStDate" name="searchStDate" style="height: 25px; margin-right: 10px;"/> 
                          ~ 
                          <input type="date" id="searchEdDate" name="searchEdDate" style="height: 25px; margin-right: 10px;"/>
						  <a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
						</span>
					</p> 
						
						<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="50px">
						                   <col width="50px">
						                   <col width="50px">
						                   <col width="50px">
						                   <col width="50px">
						                   <col width="50px">
					                 </colgroup>
								<thead>
									<tr >
							              <th scope="col">주문번호</th>
							              <th scope="col">주문일자</th>
							              <th scope="col">주문기업명</th>
							              <th scope="col">주문제품명</th>
							              <th scope="col">주문개수</th>
							              <th scope="col">발주지시서 작성</th>
									</tr>

								</thead>
								<tbody id="orderList"></tbody>
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
	
	
		<!-- 발주 모달팝업 -->
		<div id="orderPop" class="layerPop layerType2" style="width:60rem; height: 25rem;">
			<dl>
				<dt><strong>발주지시서 작성</strong></dt>
				<dd class="content">
					<div style="margin-bottom: 1rem;">
						<table class='col'>
							<thead>
								<tr>
									<th scope='col'>주문번호</th>
									<th scope='col'>주문일자</th>
									<th scope='col'>주문기업명</th>
									<th scope='col'>제품명</th>
									<th scope='col'>주문수량</th>
									<th scope='col'>발주회사</th>
									<th scope='col'>발주수량</th>
								</tr>
							</thead>
							<tbody id = ''>
															<tr>
									<td id = 'seq'></td>
									<td id = 'obtain_date'></td>
									<td id = 'cust_name'></td>
									<td id = 'item_name'></td>
									<td id = 'obtain_count'></td>
									<td>
									<select name="" id="Order_select_Company">
							            <option value="">발주회사</option>
							        </select>
									</td>
					   				<td value="발주수량" id="order_insert_count"></td>
					   				<td style="display:none" id = 'item_code'>가려야돼</td>
								</tr>
							
							</tbody>
						</table>
					</div>

					<div class="btn_areaC mt30">				
						<a class="btnType blue" id="btnOrderinsert" name="btn"><span>작성</span></a>
<!-- 						<a class="btnType blue" id="btnOrderUpdate" name="btn"><span>수정</span></a>
 -->						<a class="btnType gray" id="btnOrderClose" name="btn"><span>닫기</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>
		
		
		
	
  </form>
</body>
</html>
