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
	var pageSize = 10;
	var pageBlockPage = 10;

	$(function() {
		orderApproval()
		returnApproval()
		clickEvent()
		radioChange()
	})
 

	function orderApproval(type) {
	
		var cpage = cpage || 1;
		
		
		var param = {
			type : type,
			currentPage : cpage,
			pageSize : pageSize
		} 
	
		var callBackFunction = function(res) {
			
			console.log()
	
			$("#orderApprovalList").empty().append(res); 
			
			var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "orderApproval")
			$("#orderPag").empty().append(pagieNavigateHtml);
			$("#currentPage").val(cpage)
		}
	
		callAjax("/executives/orderApproval.do", "post", "text", false, param,
				callBackFunction);
	}
	
	function returnApproval(type, cpage) {	
		
		cpage = cpage || 1;
		
		var param = {
				type : type,
				currentPage : cpage,
				pageSize : pageSize
		}	
		var callBackFunction = function(res) {
	
			$("#returnApprovalList").empty().append(res);
			
			var pagieNavigateHtml = getPaginationHtml(cpage, $("#retotcnt").val(), pageSize, pageBlockPage, "returnApproval")
			$("#returnPag").empty().append(pagieNavigateHtml);
			$("#returnCurrentPage").val(cpage)
	
		}
		callAjax("/executives/returnApproval.do", "post", "text", false, param,
				callBackFunction);
	}
	
	function approvalModal(seq, str){
		
		$("#hiddenSeq").val(seq);
		$("#hiddenString").val(str)
		
		console.log(seq)
		console.log(str)
		
		gfModalPop("#approvalModal");
	}
	

	
	function clickEvent(){
		$("#orderY").click(function(e){
			approvalY($("#hiddenSeq").val(), $("#hiddenString").val());
		});
		$("#orderN").click(function(e){
			gfCloseModal("#approvalModal");
		});
	}
	
	function approvalY(seq, str){
		var param = {
				seq : seq,
				str : str
		}	
		var callBackFunction = function(res) {
			
			alert("승인 완료")
			location.reload(true);
		}
		callAjax("/executives/approvalY.do", "post", "text", false, param,
				callBackFunction);
	}
	
	function radioChange(){
		 $('input[type=radio][name="orderRadio"]').change(function() {
			 orderApproval($(this).val())
		 });
		 $('input[type=radio][name="returnRadio"]').change(function() {
			 returnApproval($(this).val())
		 });
	}
	
</script>

<style type="text/css">

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
.radio{
	float: right;
}
</style>
</head>
<body>
	<input type="hidden" id="currentPage" value="">
	<input type="hidden" id="returnCurrentPage" value="">
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
								class="btn_nav bold">현황</a> <span class="btn_nav bold">승인</span>
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<div>
							<div class="orderApprovalList">
								<p class="conTitle">
									<span>발주승인</span>
									<div class="radio">
										<input type="radio" value=""  name="orderRadio" checked>전체
										<input type="radio" value="Y" name="orderRadio">승인
										<input type="radio" value="N" name="orderRadio">미승인
									</div>
								</p>
								<table class="col">
									<caption>발주승인</caption>
									<colgroup>
										<col width="100px">
										<col width="100px">
										<col width="100px">
										<col width="100px">
										<col width="100px">
										<col width="100px">
										<col width="50px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">고객명</th>
											<th scope="col">제품명</th>
											<th scope="col">제품 공급가</th>
											<th scope="col">개수</th>
											<th scope="col">총액</th>
											<th scope="col">주문날짜</th>
											<th scope="col">승인여부</th>
											
										</tr>
									</thead>
									<tbody id="orderApprovalList"></tbody>
								</table>
								<div class="paging_area" id="orderPag"></div>
							</div>
							
							<div>
								<div class="divStorageList">
									<p class="conTitle">
										<span>반품입금승인</span>
										<div class="radio">
											<input type="radio" value=""  name="returnRadio" checked>전체
											<input type="radio" value="Y" name="returnRadio">승인
											<input type="radio" value="N" name="returnRadio">미승인
										</div>
									</p>
									<table class="col">
										<caption>반품입금승인</caption>
										<colgroup>
											<col width="200px">
											<col width="100px">
											<col width="100px">
											<col width="100px">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">고객명</th>
												<th scope="col">제품명</th>
												<th scope="col">주소</th>
												<th scope="col">가격</th>
												<th scope="col">개수</th>
												<th scope="col">총 가격</th>
												<th scope="col">반품 신청 일자</th>
												<th scope="col">반품 처리 일자</th>
												<th scope="col">승인여부</th>
											</tr>
										</thead>
										<tbody id="returnApprovalList"></tbody>
									</table>
									<div class="paging_area" id="returnPag"></div>
								</div>
							</div>
						</div>
						
						<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</div>
				</li>
			</ul>
		</div>
	</div>
	
	<div id="approvalModal" class="layerPop layerType2" style="width: 122px;">
		<div>
			<div class="textCenter" style="color: green;">알람</div>
			<div class="textCenter">승인하시겠습니까?</div>
			<div class="modalContent">
				<input type="hidden" value="" id="hiddenSeq">
				<input type="hidden" value="" id="hiddenString">
				<div class="left textCenter" id="orderY">
					<span>승인</span>
				</div> 
				<div class="right textCenter" id="orderN">
					<span>보류</span>
				</div>
			</div>
		</div>			
	</div>


</body>
</html>