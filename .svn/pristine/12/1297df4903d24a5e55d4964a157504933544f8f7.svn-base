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
		salesTopList();
		
	})
	
	function salesTopList(clickId) {
		
		

		var param = {
				orderBy : clickId
		}

		var callBackFunction = function(res) {

			
			$("#salesList").empty().append(res);

		}

		callAjax("/executives/salesTopList.do", "post", "text", false, param, callBackFunction);
	}
	
	
</script>

<style type="text/css">

.thead{
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
							<span>매출 TOP10</span> 
						</p> 

						<div>
							<div class="divStorageList">
								<table class="col">
									<caption>매출</caption>
									<colgroup>
										<col width="200px">
										<col width="100px">
										<col width="100px">
										<col width="100px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">고객명</th>
											<th scope="col" id="sales" class="thead" onclick="salesTopList(this.id)">매출▼</th>
											<th scope="col" id="accounts_receivable" class="thead" onclick="salesTopList(this.id)">미수금▼</th>
											<th scope="col" id="total_sum" class="thead" onclick="salesTopList(this.id)">총액▼</th>
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