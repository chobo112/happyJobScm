<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	$(function() {
		orderList()
		registerBtnEvent()
		clickEvent()
		dateCheck()
	})
	
	function registerBtnEvent(){
		$("#searchBtn").click(function(e){
			e.preventDefault();
			orderList();
		});	
	}
	
	function orderList(){
		var param = {
				searchTitle : $("#searchTitle").val(),
				searchStDate : $("#searchStDate").val(),
				searchEdDate : $("#searchEdDate").val(),
				searchSelect : $("#searchSelect").val()
		}	
		var callBackFunction = function(res) {
	
			$("#orderList").empty().append(res);
	
		}
		callAjax("/work/orderList.do", "post", "text", false, param, callBackFunction);
	}
	function depositModal(seq){
		
		$("#hiddenSeq").val(seq);
		
		
		gfModalPop("#depositModal");
	}

	function clickEvent(){
		$("#depositY").click(function(e){
			deposit($("#hiddenSeq").val());
		});
		$("#depositN").click(function(e){
			gfCloseModal("#depositModal");
		});
	}
	
	function deposit(seq){
		var param = {
				seq : seq
		}	
		var callBackFunction = function(res) {
			
			//alert("입금 완료")
			location.reload(true);
		}
		callAjax("/work/deposit.do", "post", "text", false, param, callBackFunction);
	}
	
	function dateCheck(){
		$('input[type=date][name="searchEdDate"]').change(function(){
			if($("#searchStDate").val() > $("#searchEdDate").val()){
				alert("날짜 설정을 확인하세요");
				$("#searchEdDate").val(null);
			}
		}) 
		$('input[type=date][name="searchStDate"]').change(function(){
			if($("#searchEdDate").val()){
				if($("#searchStDate").val() > $("#searchEdDate").val()){
					alert("날짜 설정을 확인하세요");
					$("#searchEdDate").val(null);
				}			
			}
		}) 
	} 
</script> 

<style type="text/css">
#searchSelect{
	width: 65px;
	height: 27px;
}

.textCenter{
	text-align: center;
}
.modalContent {
	width: 100%;
	margin: 0 auto;
	background-color: white;
}
.right{
	float: right;
	width : 60px;
	border-top:1px solid black;
	cursor: pointer;
}
.left{
	float: left;
	width : 61px;
	border-top:1px solid black;
	border-right:1px solid black;
	cursor: pointer;
}

</style>
</head>
<body>
	<input type="hidden" id="currentPage" value="">
	<!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
	<input type="hidden" name="action" id="action" value="">
	<div id="wrap_area">
		<h2 class="hidden">header 영역</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> <jsp:include
						page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">
						<p class="Location">
							<a href="#" class="btn_set home">메인으로</a> <a href="#"
								class="btn_nav bold">담당업무</a> <span class="btn_nav bold">발주서현황</span>
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<div>
							<div class="orderApprovalList">
								<p class="conTitle">
									<span>발주서현황</span>
									<span class="fr">
										<select id="searchSelect">
											<option value="company">업체</option>
											<option value="product">제품</option>
										</select>
										<input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
										기간
										<input type="date" id="searchStDate" name="searchStDate" style="height: 25px; margin-right: 10px;"/> 
										~ 
										<input type="date" id="searchEdDate" name="searchEdDate" style="height: 25px; margin-right: 10px;"/>
										<a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
									</span>
								</p>
								<table class="col">
									<caption>발주승인</caption>
									<colgroup>
										<col width="60px">
										<col width="100px">
										<col width="60px">
										<col width="120px">
										<col width="40px">
										<col width="120px"> 
										<col width="130px">
										<col width="80px">
										<col width="55px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">발주번호</th>
											<th scope="col">발주회사</th>
											<th scope="col">제품명</th>
											<th scope="col">가격</th>
											<th scope="col">개수</th>
											<th scope="col">총액</th>
											<th scope="col">주문날짜</th>
											<th scope="col">임원승인여부</th>
											<th scope="col">임금확인</th>
										</tr>
									</thead>
									<tbody id="orderList"></tbody>
								</table>
								<div class="paging_area" id="pagingNavi"></div>
							</div>
							
							
						</div>
						
						<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</div>
				</li>
			</ul>
		</div>
	</div>
	
	<div id="depositModal" class="layerPop layerType2" style="width: 122px;">
		<div>
			<div class="textCenter" style="color: green;">알람</div>
			<div class="textCenter">입금하시겠습니까?</div>
			<div class="modalContent">
				<input type="hidden" value="" id="hiddenSeq">
				<div class="left textCenter" id="depositY">
					<span>입금</span>
				</div> 
				<div class="right textCenter" id="depositN">
					<span>보류</span>
				</div>
			</div>
		</div>			
	</div>

</body>
</html>