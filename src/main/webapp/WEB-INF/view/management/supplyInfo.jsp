<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>납품 업체 정보</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
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
						
						
					<p class="conTitle">
						
						<select id="searchCondition">
							<option value="0">납품업체명</option>
							<option value="1">제품명</option>
						</select> 
						
						<span class="fr">					
                          <input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
                          <a class="btnType red" name="searchbtn"  id="searchBtn"><span>검색</span></a>
                          
						</span>
					</p> 
						
					<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="50px">
						                   <col width="70px">
						                    <col width="60px">
						                   <col width="70px">
						                   <col width="50px">
					                 </colgroup>
								<thead>
									<tr>
							            <th scope="col" >납품 업체명</th>
							            <th scope="col">LOGIN ID</th>
							            <th scope="col">패스워드</th>
							            <th scope="col">담당자 명</th>
							            <th scope="col">담당자 연락처</th>
									</tr>
								</thead>
								<tbody id="supplyList"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingNavi">
							</div>
											
					</div>
					<div id=custDetail></div>
		
				    </div> <!--// content -->
				    
				    <div class="content">
						
						
					<div class="test">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="70px">
						                   <col width="90px">
						                    <col width="80px">
						                    <col width="60px">
					                 </colgroup>
								<thead>
									<tr>
							            <th scope="col">제품 번호</th>
							            <th scope="col">제품 명</th>
							            <th scope="col">제품 단가</th>
							            <th scope="col">제품 수량</th>
									</tr>
								</thead>
								<tbody id="custProduct"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							
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
<script>
var pageSize = 6;
var pageBlockPage = 10;

$(document).ready(function() {
	
    $("#supplyId").click(function() { //신규등록 버튼 클릭 시 실행
    	var callBackFunction = function(response){
	    	$("#컴포넌트 위치").empty().append(response);
	    }
	        
	    var param = { paramId : $(this).data('supplyid')};

	    callAjax("/management/custProduct.do", "post", "text", false, param,callBackFunction);
    });
    
    $("#searchBtn").click(function() {
    	detailSearch();
    });
    
});

$(function(){
	supplySearch();
	$('.test').hide();
})

function supplySearch(cpage){
	cpage = cpage || 1;
	
	
	var param = {
			currentPage : cpage,
			pageSize : pageSize,
	};
	
	var callBackFunction = function(response){
		$("#supplyList").empty().append(response);
		
		var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "supplySearch");
		$("#pagingNavi").empty().append(pagieNavigateHtml);
		$("#currentPage").val(cpage);
	}
	
	callAjax("/management/supplyList.do", "post", "text", false, param,callBackFunction);
}

function detailSearch(cpage){ /////검색 기능
	cpage = cpage || 1;
	var searchTitle = $('#searchTitle').val();
	var condition = $('#searchCondition').val();
	var custName = "";
	var itemName = "";
	
	switch(condition){
	case "0":
		custName = searchTitle;
		break;
	case "1":
		itemName = searchTitle;
		break;
	}
	
	var param = {
			searchCustName : custName,
			searchItemName : itemName,
			condition : condition,
			currentPage : cpage,
			pageSize : pageSize
	};
	
	var callBackFunction = function(response){
		$("#supplyList").empty().append(response);
		
		var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "detailSearch")
		$("#pagingNavi").empty().append(pagieNavigateHtml);
		$("#currentPage").val(cpage);
	}
	
	
	callAjax("/management/supplySearch.do", "post", "text", false, param,callBackFunction);
}
</script>
</html>
