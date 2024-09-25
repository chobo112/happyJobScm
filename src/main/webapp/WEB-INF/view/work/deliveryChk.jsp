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
		deliveryList()
		registerBtnEvent()
		clickEvent()
		radioChange()
		dateCheck()
	})
	
	function registerBtnEvent(){
		$("#searchBtn").click(function(e){
			e.preventDefault();
			deliveryList();
		});	
	}
	
	function deliveryList(type){
		var param = {
				searchTitle : $("#searchTitle").val(),
				searchStDate : $("#searchStDate").val(),
				searchEdDate : $("#searchEdDate").val(),
				searchSelect : $("#searchSelect").val(),
				type : type
		}	
		var callBackFunction = function(res) {
	
			$("#deliveryList").empty().append(res);
	
		}
		callAjax("/work/deliveryList.do", "post", "text", false, param, callBackFunction);
	}
	function deliveryModal(seq){
		
		var param = {
				delivery_num : seq
		}	
		var callBackFunction = function(res) {
	
			$("#modalItem_name").val(res[0].item_name)
			$("#modalObtain_count").val(res[0].obtain_count)
			$("#modalDelivery_num").val(res[0].delivery_num)
			$("#modalDelivery_state").val(res[0].delivery_state)
			if(res[0].delivery_state == '배송완료'){
				$("#deliveryY").css({
					'color' : '#bbc2cd',
					'cursor': 'default'
				})
			}else{
				$("#deliveryY").css({
					'color' : 'black',
					'cursor': 'pointer'
				})
			}
			//$("#deliveryList").empty().append(res);
			gfModalPop("#deliveryModal");
	
		}
		callAjax("/work/deliveryDetail.do", "post", "json", false, param, callBackFunction);
	}

	function clickEvent(){
		$("#deliveryY").click(function(e){
			if($("#modalDelivery_state").val() == '배송중'){
				
				deleveryDone($("#modalDelivery_num").val()) 
			}
		});
		$("#deliveryN").click(function(e){
			gfCloseModal("#deliveryModal");
		});
	}
	
	function radioChange(){
		 $('input[type=radio][name="deliveryRadio"]').change(function() {
			 deliveryList($(this).val())
		 });
		 $('input[type=radio][name="deliveryRadio"]').change(function() {
			 deliveryList($(this).val())
		 });
	}
	
	function deleveryDone(num){
		var param = {
				delivery_num : num
		}	
		var callBackFunction = function(res) {
	
			console.log(res)
			deliveryList();
			gfCloseModal("#deliveryModal");
	
		}
		callAjax("/work/deleveryDone.do", "post", "text", false, param, callBackFunction);
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
	text-align: center;
}
.left{
	float: left;
	width : 61px;
	border-top:1px solid black;
	border-right:1px solid black;
	cursor: pointer;
	text-align: center;
}
.radio{
	float: right;
}
.modalInput{
	border: 1px solid white;
	width: 98%;
	text-align: right;
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
								class="btn_nav bold">담당업무</a> <span class="btn_nav bold">배송처리</span>
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<div>
							<div class="deliveryList">
								<p class="conTitle">
									<span>배송처리</span>
									<span class="fr">
										담당자
										<input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
										기간
										<input type="date" id="searchStDate" name="searchStDate" style="height: 25px; margin-right: 10px;"/> 
										~ 
										<input type="date" id="searchEdDate" name="searchEdDate" style="height: 25px; margin-right: 10px;"/>
										<a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
									</span>
								</p>
								<div class="radio">
									<input type="radio" value=""  name="deliveryRadio" checked>전체
									<input type="radio" value="ing" name="deliveryRadio">배송중
									<input type="radio" value="done" name="deliveryRadio">배송완
								</div>
								<table class="col">
									<caption>발주승인</caption>
									<colgroup>
										<col width="60px">
										<col width="100px">
										<col width="60px">
										<col width="120px">
										<col width="40px">
										<col width="40px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">배송번호</th>
											<th scope="col">배송담당자</th>
											<th scope="col">출발지</th>
											<th scope="col">목적지</th>
											<th scope="col">배송결과</th>
											<th scope="col">상세보기</th>
										</tr>
									</thead>
									<tbody id="deliveryList"></tbody>
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
	
	<div id="deliveryModal" class="layerPop layerType2" style="width: 122px;">
		<div>
			<div class="textCenter" style="color: green;">상세보기</div>
			
			<div>
				<div>
					<div>제품명</div>
					<input id="modalItem_name" class="modalInput" disabled>
				</div>
				<div>
					<div>수량</div>
					<input id="modalObtain_count" class="modalInput" disabled>
				</div>
				<input type="hidden" id="modalDelivery_num">
				<input type="hidden" id="modalDelivery_state">
			</div>
			<div>
				<div class="left" id="deliveryY">배송완료</div>
				<div class="right" id="deliveryN">취소</div>
			</div>
			
		</div>			
	</div>

</body>
</html>