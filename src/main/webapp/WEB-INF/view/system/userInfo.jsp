<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기업고객/직원정보 관리(등록,수정)</title>

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
						<span>test1</span>
						<select>
							<option>회사명</option>
							<option>직원명</option>
							<option>담당자명</option>
							<option>담당업무</option>
						</select> 
						
						<span class="fr">					
                          <input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
                          <input type="checkbox" name="xxx" value="yyy" unchecked>
							삭제된 정보 표시
                          <a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
                          
						</span>
					</p> 
						
					<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="50px">
						                   <col width="150px">
						                    <col width="60px">
						                   <col width="50px">
						                   <col width="150px">
					                 </colgroup>
								<thead>
									<tr>
							              <th scope="col">구분</th>
							              <th scope="col">회사명/성명</th>
							              <th scope="col">담당업무</th>
							              <th scope="col">담당자명</th>
							              <th scope="col">연락처</th>
									</tr>
								</thead>
								<tbody id="noticeList"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingNavi">
							</div>
											
						</div>
						<a class="btnType red" href="" name="newRegister"  id="newRegister"><span>신규 등록</span></a>
						<a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>삭제</span></a>
						<div>						
							<select>
								<option>기업고객</option>
								<option>내부직원</option>
							</select>
							<span>아이디</span>
							<input type="text" id="userId" name="userId" style="height: 25px; margin-right: 10px;"/>
							비밀번호
							<input type="text" id="passwd" name="passwd" style="height: 25px; margin-right: 10px;"/> 	
							<br><span>      </span>
							회사명
							<input type="text" id="copName" name="copName" style="height: 25px; margin-right: 10px;"/>
							담당자명
							<input type="text" id="manager" name="manager" style="height: 25px; margin-right: 10px;"/>
							<br>
							연락처
							<input type="text" id="phon" name="phon" style="height: 25px; margin-right: 10px;"/>
							이메일
							<input type="text" id="email" name="email" style="height: 25px; margin-right: 10px;"/>
							<br>
							직원명
							<input type="text" id="clerk" name="clerk" style="height: 25px; margin-right: 10px;"/>
							담당업무
							<span>
								<select>
									<option>SCM</option>
									<option>배송</option>
									<option>구매</option>
									<option>임원</option>
								</select>
							</span>  
							<br>
							우편번호
							<input type="text" id="zipCode" name="zipCode" style="height: 25px; margin-right: 10px;"/><br>
							주소
							<input type="text" id="address" name="address" style="height: 25px; margin-right: 10px;"/><br>
							상세주소
							<input type="text" id="addressDetail" name="addressDetail" style="height: 25px; margin-right: 10px;"/>
							
												
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

var pageSize = 5;
var pageBlockPage = 10;

$(document).ready(function() {
    // 버튼 클릭 이벤트 리스너 추가
    $("#newRegister").click(function() {
        alert("버튼이 클릭되었습니다!");
    });
});

$(function(){
	userSearch();
})

function userSearch(cpage){
	cpage = cpage || 1;
	
	// 공지사항 데이터 보여주는 로직
	var param = {
			searchTitle : $("#searchTitle").val(),
			searchStDate : $("#searchStDate").val(),
			searchEdDate : $("#searchEdDate").val(),
			currentPage : cpage,
			pageSize : pageSize
	};
	
	var callBackFunction = function(response){
		$("#userList").empty().append(response);
		
		var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "noticeSearch")
		$("#pagingNavi").empty().append(pagieNavigateHtml);
		$("#currentPage").val(cpage);
	}
	
	callAjax("/system/userList.do", "post", "text", false, param,callBackFunction);
}
</script>
</html>