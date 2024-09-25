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
		storageList();
		registerBtnEvent();

	})
	
	function registerBtnEvent(){
		$("#searchBtn").click(function(e){
			e.preventDefault();
			storageList();
		});
		
		
	}

	function storageList() {

		var param = {
			searchTitle : $("#searchTitle").val()
		}

		var callBackFunction = function(res) {

			
			$("#storageList").empty().append(res);

		}

		callAjax("/executives/storageList.do", "post", "text", false, param, callBackFunction);
	}
	
	function storageDetailModal(storage_code){
		var param = {
				storage_code : storage_code
		};

		var callBackFunction = function(res) {

			
			$("#storageInven").empty().append(res);
			$("#btnSaveStorage").hide();
			$("#btnUpdateStorage").show();
			
			gfModalPop("#storageDetailModal");
			
		}

		callAjax("/executives/storageDetail.do", "post", "text", false, param, callBackFunction);
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
							<span class="btn_nav bold">창고 현황</span> 
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>
						
						<p class="conTitle">
							<span>창고 검색</span> 
							<span class="fr">창고이름
	                        	<input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
	                        	<a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
							</span>
						</p> 

						<div>
							<div class="divStorageList">
								<table class="col">
									<caption>창고</caption>
									<colgroup>
										<col width="20px">
										<col width="100px">
										<col width="60px">
										<col width="50px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">창고번호</th>
											<th scope="col">창고이름</th>
											<th scope="col">창고위치</th>
											<th scope="col">담당자</th>
										</tr>
									</thead>
									<tbody id="storageList"></tbody>
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
	
	<div id="storageDetailModal" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>창고별 현황</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<thead>
						<tr>
							<th scope="col">창고이름</th>
							<th scope="col">상품이름</th>
							<th scope="col">상품가격</th>
							<th scope="col">상품개수</th>
						</tr>
					</thead>
					<tbody id="storageInven"></tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

		
			</dd>

		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

</body>
</html>