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
		salesList();
		registerBtnEvent();
		dateCheck();
	})
	
	function registerBtnEvent(){
		$("#searchBtn").click(function(e){
			e.preventDefault();
			salesList();
		});	
	}
	
	function salesList(cpage) {

		cpage = cpage || 1;
		
		var param = {
				searchTitle : $("#searchTitle").val(),
				searchStDate : $("#searchStDate").val(),
				searchEdDate : $("#searchEdDate").val(),
				currentPage : cpage,
				pageSize : pageSize
		}

		var callBackFunction = function(res) {

			$("#salesList").empty().append(res);
			
			var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "salesList")
			$("#pagingNavi").empty().append(pagieNavigateHtml);
			$("#currentPage").val(cpage);

		}

		callAjax("/executives/salesList.do", "post", "text", false, param, callBackFunction);
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
					<!-- lnb 영역 -->
					<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> 
					<!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">
						<p class="Location">
							<a href="#" class="btn_set home">메인으로</a> 
							<a href="#"	class="btn_nav bold">현황</a> 
							<span class="btn_nav bold">매출</span> 
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>
						
						<p class="conTitle">
							<span>매출</span> 
							<span class="fr">기업 고객명
								<input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
								기간
								<input type="date" id="searchStDate" name="searchStDate" style="height: 25px; margin-right: 10px;"/> 
								~ 
								<input type="date" id="searchEdDate" name="searchEdDate" style="height: 25px; margin-right: 10px;"/>
								<a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
							</span>
						</p> 

						<div>
							<div class="divStorageList">
								<table class="col">
									<caption>창고</caption>
									<colgroup>
										<col width="200px">
										<col width="100px">
										<col width="100px">
										<col width="100px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">고객명</th>
											<th scope="col">매출</th>
											<th scope="col">미수금</th>
											<th scope="col">총액</th>
										</tr>
									</thead>
									<tbody id="salesList"></tbody>
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
	
	

</body>
</html>