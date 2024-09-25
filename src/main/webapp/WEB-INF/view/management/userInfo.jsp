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
						
						<select id="searchCondition">
							<option value="0">회사명</option>
							<option value="1">직원명</option>
							<option value="2">담당자명</option>
							<option value="3">담당업무</option>
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
								<tbody id="userList"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingNavi">
							</div>
											
						</div>
						<a class="btnType red" name="newRegister"  id="newRegister"><span>신규 등록</span></a>
						<a class="btnType red"  href="" name="deleteBtn"  id="deleteBtn"><span>삭제</span></a>
						
						<div id=new style="border:2px solid">						
							<select id="type">
								<option value="B">기업고객</option>
								<option value="C">내부직원</option>
							</select>
							
							<table class="row">
								<caption>caption</caption>
								<colgroup>
									<col width="120px">
									<col width="*">
									<col width="120px">
									<col width="*">	
								</colgroup>
								<tbody>
									<tr>
										<th><span>아이디</span></th>
										<td><input type="text" id="userId" name="userId" style="height: 25px; margin-right: 10px;"/></td>
									
									
										<th>비밀번호</th>
										<td><input type="text" id="passwd" name="passwd" style="height: 25px; margin-right: 10px;"/></td>
							 	
										<th>연락처</th>
										<td><input type="text" id="phone" name="phon" style="height: 25px; margin-right: 10px;"/></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td><input type="text" id="email" name="email" style="height: 25px; margin-right: 10px;"/></td>
							
										<th>직원명</th>
										<td><input type="text" id="clerk" name="clerk" style="height: 25px; margin-right: 10px;"/></td>
										<th>담당업무</th>
										<td>
											<select id="jobCode">
												<option value="A">임원</option>
												<option value="B">고객</option>
												<option value="C">SCM 관리자.</option>
												<option value="D">배송 담당자</option>
												<option value="E">구매 담당자</option>
											</select>
										</td>
							
									</tr>  
									<tr>
										<th>우편번호</th>
										<td><input type="text" id="zipCode" name="zipCode" style="height: 25px; margin-right: 10px;"/><br></td>
										<th>주소</th>
										<td><input type="text" id="address" name="address" style="height: 25px; margin-right: 10px;"/><br></td>
										<th>상세주소</th>
										<td><input type="text" id="addressDetail" name="addressDetail" style="height: 25px; margin-right: 10px;"/></td>
									</tr>
								</tbody>
							</table>
							<a class="btnType red" href="" name="regist"  id="registBtn"><span>등록</span></a>
							<a class="btnType red"  name="cancle"  id="cancleBtn"><span>취소</span></a>
							
						</div>
						<div id=detail></div>
		
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
var de = $("#new");

$(document).ready(function() {
	
    $("#newRegister").click(function() { //신규등록 버튼 클릭 시 실행
        $("#userdetail").empty();
        $("#new").show();
        $("#deleteBtn").hide();
    });
    
    $("#registBtn").click(function() {
    	userRegist();
    });
    
    $("#deleteBtn").click(function() {
    	userDelete();
    });
       
    $("#cancleBtn").click(function() {
    	registCancle();
    })
    
    $("#searchBtn").click(function() {
    	detailSearch();
    })
    
});

$(function(){
	userSearch();
	$("#new").hide();
	$("#deleteBtn").hide();
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
		
		var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "userSearch")
		$("#pagingNavi").empty().append(pagieNavigateHtml);
		$("#currentPage").val(cpage);
	}
	
	callAjax("/management/userList.do", "post", "text", false, param,callBackFunction);
}

function userRegist(){ ////////신규 등록 기능
	var loginId = $('#userId').val();
	var name = $('#clerk').val();
	var user_type = $('#type').val();
	var password = $('#passwd').val();
	var hp = $('#phone').val();
	var email = $('#email').val();
	var zip_code = $('#zipCode').val();
	var addr = $('#address').val();
	var addr_detail = $('#addressDetail').val();
	var job_code = $('#jobCode').val();
	
	
	var param = {
			loginID : loginId,
			user_Type : user_type,
			name : name,
			password : password,
			hp : hp,
			email : email,
			zip_code : zip_code,
			addr : addr,
			addr_detail : addr_detail,
			job_code : job_code 
	};
	
	var callBackFunction = function(response){
		alert("저장 됐습니다");
	}
	
	if(loginId == '' || name == '' || user_type == '' || password == '' || hp == '' || email == '' || zip_code == '' || addr == '' || addr_detail == '' || job_code == ''){
		alert("입력되지 않은 항목이 존재합니다.");
	}
	else {
		callAjax("/management/regist.do", "post", "text", false, param,callBackFunction);	
	}

	
}

function userDelete(){ /////삭제 기능
	loginId = $('#userId2').val()
	
	var param = {
			loginID : loginId
	};
	
	var callBackFunction = function(response){
		alert("삭제 됐습니다");
	}
	
	callAjax("/management/userDelete.do", "post", "text", false, param,callBackFunction);
}

function registCancle(){ /////등록 취소 기능
	$("#new").hide();
}

function detailSearch(cpage){ /////검색 기능
	cpage = cpage || 1;
	var searchTitle = $('#searchTitle').val();
	var condition = $('#searchCondition').val();
	var custName = "";
	var userName = "";
	var custPerson = "";
	var job = "";
	
	switch(condition){
	case "0":
		custName = searchTitle;
		break;
	case "1":
		userName = searchTitle;
		break;
	case "2":
		custPerson = searchTitle;
		break;
	case "3":
		job = searchTitle;
		break;
	}
	
	var param = {
			searchCustName : custName,
			searchUserName : userName,
			searchCustPerson : custPerson,
			searchJob : job,
			currentPage : cpage,
			pageSize : pageSize
	};
	
	var callBackFunction = function(response){
		$("#userList").empty().append(response);
		
		var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "detailSearch")
		$("#pagingNavi").empty().append(pagieNavigateHtml);
		$("#currentPage").val(cpage);
	}
	
	
	callAjax("/management/userSearch.do", "post", "text", false, param,callBackFunction);
}

</script>
</html>