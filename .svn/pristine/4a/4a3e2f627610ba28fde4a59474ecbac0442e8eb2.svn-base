<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							<option value="0">그룹코드</option>
							<option value="1">상세코드</option>
							<option value="2">상세코드명</option>
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
						                   <col width="130px">
						                    <col width="90px">
						                   <col width="50px">
						                   <col width="150px">
						                   <col width="50px">
					                 </colgroup>
								<thead>
									<tr>
							              <th scope="col">순번</th>
							              <th scope="col">그룹 코드</th>
							              <th scope="col">그룹 코드 명</th>
							              <th scope="col">사용 여부</th>
							              <th scope="col">등록일</th>
							              <th scope="col">비고</th>
									</tr>
								</thead>
								<tbody id="codeView"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingNavi">
							</div>
											
						</div>
						<a class="btnType red" name="newRegister"  id="newRegister"><span>등록</span></a>
						<br>
						
						<div class="divDetailList2">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="50px">
						                   <col width="130px">
						                    <col width="90px">
						                   <col width="150px">
						                   <col width="50px">
						                   <col width="50px">
					                 </colgroup>
								<thead>
									<tr>
							              <th scope="col">순번</th>
							              <th scope="col">그룹 코드</th>
							              <th scope="col">상세 코드</th>
							              <th scope="col">상세 코드명 </th>
							              <th scope="col">사용 여부</th>
							              <th scope="col">비고</th>
									</tr>
								</thead>
								<tbody id="detailCodeView"></tbody>
							</table>
					<a class="btnType red" name="newRegister"  id="newDetailRegister"><span>새 상세 코드 등록</span></a>			
					</div> <!--// content -->

					<div id="myModal" class="modal">
						<div class="modal-content">
            				<span class="close">&times;</span>
            				그룹 코드
							<input type="text" id="groupCodeModal" style="height: 25px; margin-right: 10px;"/><br>
							그룹 코드 명
							<input type="text" id="groupCodeNameModal" style="height: 25px; margin-right: 10px;"/><br>
							사용 여부
							<input type="radio" id="yn1" name="codeRadio" value="0" style="height: 25px; margin-left: 3px; margin-right: 1px;"/>
							YES
							<input type="radio" id="yn2" name="codeRadio" value="1" style="height: 25px; margin-left: 10px;"/>
							NO
							<br>
							<input type="hidden" id="groupCodeModalOrigin" >
							<input type="hidden" id="groupCodeNameModalOrigin" >
							<input type="hidden" id="groupYnOrigin" >
						
							
							<div class="modal-footer">
								<button class="btn2 btn-primary">저장</button>
                				<button class="btn1 btn-primary">삭제</button>
                				<button class="btn btn-primary">취소</button>						
            				</div>
        				</div>
					</div>
					
					<div id="myModal2" class="modal">
						<div class="modal-content">
            				<span class="close">&times;</span>
            				상세 코드
							<input type="text" id="detailCodeModal" style="height: 25px; margin-right: 10px;"/><br>
							상세 코드 명
							<input type="text" id="detailCodeNameModal" style="height: 25px; margin-right: 10px;"/><br>
							사용 여부
							<input type="radio" id="detailyn1" name="detailcodeRadio" value="0" style="height: 25px; margin-left: 3px; margin-right: 1px;"/>
							YES
							<input type="radio" id="detailyn2" name="detailcodeRadio" value="1" style="height: 25px; margin-left: 10px;"/>
							NO
							<br>
							<input type="hidden" id="detailCodeModalOrigin" >
							<input type="hidden" id="detailCodeNameModalOrigin" >
							<input type="hidden" id="detailYnOrigin" >
						
							
							<div class="modal-footer">
								<button class="btn2Dtail btn-primary">저장</button>
                				<button class="btn1Dtail btn-primary">삭제</button>
                				<button class="btnDtail btn-primary">취소</button>						
            				</div>
        				</div>
					</div>
					
					
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
	
    $(".close").click(function() {
    	$("#myModal").hide();
    });
    
    $(".btn").click(function() {
    	$("#myModal").hide();
    });
    
    $(".btn1").click(function() {
    	comCodeDelete();
    });
    
    $(".btn2").click(function() {
    	if( $('#groupCodeModalOrigin').val() == ''){
    		comCodeRegist();
    	}
    	else {
    		comCodeAdjust();
    	}
    });
    
    $("#newRegister").click(function() {
    	$(".btn1").hide();
    	$("#myModal").show();
    	$('#groupCodeModal').val('');
    	$('#groupCodeNameModal').val('');
    	$('#yn1').prop('disabled');
    	$('#groupCodeModalOrigin').val('');
    });
    
    $("#searchBtn").click(function() {  //검색 버튼 클릭 이벤트
    	detailSearch();
    });
    
});


$(function(){
	getCodeList();
	
	$('.divDetailList2').hide();
})


function getCodeList(cpage){
	cpage = cpage || 1;
	
	var param = {
			currentPage : cpage,
			pageSize : pageSize
	};
	
	var callBackFunction = function(response){
		$("#codeView").empty().append(response);
		
		var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "getCodeList")
		$("#pagingNavi").empty().append(pagieNavigateHtml);
		$("#currentPage").val(cpage);
	}
	
	callAjax("/management/getCodeList.do", "post", "text", false, param,callBackFunction);
}


function comCodeAdjust(){ // 저장 버튼 클릭 시 발동
	var group_code = $('#groupCodeModal').val();
	var group_name= $('#groupCodeNameModal').val();
	var checked = $('#yn1').prop('checked') == true ? 'Y' : 'N';
	
	var group_codeOri = $('#groupCodeModalOrigin').val();
	var group_nameOri= $('#groupCodeNameModalOrigin').val();
	var checkedOri = $('#groupYnOrigin').val();
	
	var test1 = group_code != group_codeOri ? group_code : '';
	var test2 = group_name != group_nameOri ? group_name : '';
	var test3 = checked != checkedOri ? checked : '';
	
	
	
	var param = {
		group_code : test1,
		group_name : test2,
		use_yn : test3,
		group_id : group_codeOri
	};
	
	var callBackFunction = function(response){
		alert("수정 됐습니다");
		$("#myModal").hide();
	}
	
	callAjax("/management/comCodeAdjust.do", "post", "text", false, param,callBackFunction);
}


function comCodeRegist(){ // 등록 버튼 클릭 시 발동
	var group_code = $('#groupCodeModal').val();
	var group_name= $('#groupCodeNameModal').val();
	var checked = $('#yn1').prop('checked') == true ? 'Y' : 'N';
	
	
	var param = {
			group_code : group_code,
			group_name : group_name,
			use_yn : checked
	};
	
	
	
	var callBackFunction = function(response){
		alert("등록 됐습니다");
		$("#myModal").hide();
	}
	
	callAjax("/management/comCodeRegist.do", "post", "text", false, param,callBackFunction);
}

function comCodeDelete(){ // 삭제 버튼 클릭 시 발동
	var group_codeOri = $('#groupCodeModalOrigin').val();
	
	var param = {
		group_code : group_codeOri
	};
	
	var callBackFunction = function(response){
		alert("삭제 됐습니다");
		$("#myModal").hide();
	}
	
	callAjax("/management/comCodeDelete.do", "post", "text", false, param,callBackFunction);
}

function detailSearch(cpage){ /////검색 기능
	cpage = cpage || 1;
	var searchTitle = $('#searchTitle').val();
	var condition = $('#searchCondition').val();
	var groupCode = "";
	var detailCode = "";
	var detailName = "";
	
	switch(condition){
	case "0":
		groupCode = searchTitle;
		break;
	case "1":
		detailCode = searchTitle;
		break;
	case "2":
		detailName = searchTitle;
		break;
	}
	
	var param = {
			searchGroupCode : groupCode,
			searchDetailCode : detailCode,
			searchDetailName : detailName,
			condition : condition,
			currentPage : cpage,
			pageSize : pageSize
	};
	
	var callBackFunction = function(response){
		$("#codeView").empty().append(response);
		
		var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "detailSearch")
		$("#pagingNavi").empty().append(pagieNavigateHtml);
		$("#currentPage").val(cpage);
	}
	
	
	callAjax("/management/comnCodeSearch.do", "post", "text", false, param,callBackFunction);
}

</script>

<style>
        /* 모달 배경 */
        .modal {
            display: none; /* 기본적으로 모달을 숨김 */
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }

        /* 모달 콘텐츠 */
        .modal-content {
            position: fixed;
            left: 58%;
            top: 50%;
            transform: translate(-50%, -50%);
            background-color: #fefefe;
            padding: 30px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px; /* 최대 너비 설정 */
            box-shadow: 0px 5px 15px rgba(0,0,0,0.5);
        }

        /* 닫기 버튼 */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
         /* 모달 안의 버튼 */
        .modal-footer .btn {
            position: absolute;
            bottom: 20px;
            right: 20px;
        }
        .modal-footer .btn2 {
            position: absolute;
            bottom: 20px;
            right: 60px;
        }
        .modal-footer .btn1 {
            position: absolute;
            bottom: 20px;
            right: 100px;
        }
</style>
