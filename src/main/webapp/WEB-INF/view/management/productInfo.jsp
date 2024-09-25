<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품 정보 관리</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
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
							<option value="0">제품명</option>
							<option value="1">제품코드명</option>
							<option value="2">제조사</option>
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
						                    <col width="60px">
						                   <col width="80px">
						                   <col width="70px">
						                   <col width="50px">
					                 </colgroup>
								<thead>
									<tr>
							              
							              <th scope="col">제품 코드</th>
							              <th scope="col">제품 명</th>
							              <th scope="col">제조사</th>
							              <th scope="col">판매가</th>
									</tr>
								</thead>
								<tbody id="productList"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingNavi">
							</div>
											
						</div>
						<a class="btnType red" name="newRegister"  id="newRegister"><span>제품 등록</span></a>
					</div> <!--// content -->
					
					
					<div id="myModal" class="modal" style="width: max;" >
						<div class="modal-content">
							<table class="row">
								<caption>caption</caption>
								<colgroup>
									<col width="120px">
									<col width="*">
									<col width="120px">
									<col width="*">
								</colgroup>
								<span class="close">&times;</span>
								<tbody>
								
									<tr id="imageTag">
            							<th>이미지</th>
            							<td colspan="3"><img id="productImg" src="" alt="제품 이미지" style="width:100%;max-width:300px"></td>
            						</tr>
            						<tr>
            							<th scope="row">제품 번호</th> 
										<td ><input type="text" id="modalProductCode" style="height: 25px; margin-right: 10px;" class="inputTxt p100"/></td>
										<th scope="row">제품 명</th>
										<td ><input type="text" id="modalProductName" style="height: 25px; margin-right: 10px;" class="inputTxt p100"/><br></td>
									</tr>
									<tr>
										<th scope="row">제조사</th>
										<td ><input type="text" id="modalManufac" style="height: 25px; margin-right: 10px;" class="inputTxt p100"/><br></td>
										<th scope="row">제품 가격</th>
										<td ><input type="text" id="modalValue" style="height: 25px; margin-right: 50px;" class="inputTxt p100"/><br></td>
									</tr>
									<tr>
										<th scope="row" >상세 정보</th>
										<td colspan="5"><textarea id="modaldetail" style="height: 25px; margin-right: 50px;" class="inputTxt p100" colspan="2" cols="40" rows="5"></textarea><br></td>
									</tr>
								</tbody>
            				</table>
							<br>
							<input type="hidden" id="modalProductCodeOrigin" >
							<input type="hidden" id="modalProductNameOrigin" >
							<input type="hidden" id="modalManufacOrigin" >
							<input type="hidden" id="modalproductValueOrigin" >
							<input type="hidden" id="modalproductDetailOrigin" >
							
				
						
							
							<div class="modal-footer">
								<button class="btn2 btn-primary">저장</button>
                				<button class="btn1 btn-primary">삭제</button>
                				<button class="btn btn-primary">취소</button>						
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
    
    $("#newRegister").click(function() { //새 제품등록 버튼 클릭 이벤트
    	$(".btn1").hide();
    	$("#myModal").show();
    	$('#modalProductCode').val('');
    	$('#modalProductName').val('');
    	$('#modalManufac').val('');
    	$('#modalValue').val('');
    	$('#modaldetail').val('');
    	$('#modalProductCodeOrigin').val('');
    	document.getElementById('productImg').src = '';
    	$("#imageTag").hide();
    });
    
    
    $("#searchBtn").click(function() {  //검색 버튼 클릭 이벤트
    	detailSearch();
    });
    
    $(".close").click(function() {
    	$("#myModal").hide();
    });
    
    $(".btn").click(function() {
    	$("#myModal").hide();
    });
    
    $(".btn1").click(function() { //삭제 버튼
    	var itemCode = $("#modalProductCode").val();
    	productDelete(itemCode);
    });
    
    $(".btn2").click(function() { // 저장버튼
    	if( $('#modalProductCodeOrigin').val() == ''){
    		productRegist();
    	}
    	else {
    		productUpdate();
    	}
    	
    });
    
     
});


$(function(){
	getProductList();
	
	
	
})


function getProductList(cpage){
	cpage = cpage || 1;
	
	// 공지사항 데이터 보여주는 로직
	var param = {
			currentPage : cpage,
			pageSize : pageSize
	};
	
	var callBackFunction = function(response){
		$("#productList").empty().append(response);
		
		var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "getProductList")
		$("#pagingNavi").empty().append(pagieNavigateHtml);
		$("#currentPage").val(cpage);
	}
	
	callAjax("/management/getProductList.do", "post", "text", false, param,callBackFunction);
}


function detailSearch(cpage){ /////검색 기능
	cpage = cpage || 1;
	var searchTitle = $('#searchTitle').val();
	var condition = $('#searchCondition').val();
	var itemCode = "";
	var itemName = "";
	var manufac = "";
	
	switch(condition){
	case "0":
		itemName = searchTitle;
		break;
	case "1":
		itemCode = searchTitle;
		break;
	case "2":
		manufac = searchTitle;
		break;
	}
	
	var param = {
			searchItemName : itemName,
			searchItemCode : itemCode,
			searchManufac : manufac,
			condition : condition,
			currentPage : cpage,
			pageSize : pageSize
	};
	
	var callBackFunction = function(response){
		$("#productList").empty().append(response);
		
		var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "detailSearch")
		$("#pagingNavi").empty().append(pagieNavigateHtml);
		$("#currentPage").val(cpage);
	}
	
	
	callAjax("/management/productSearch.do", "post", "text", false, param,callBackFunction);
}


function productRegist(){ // 저장 버튼 클릭 시 분기되어 실행됨 (제품 새로 등록)
	var product_code = $('#modalProductCode').val();
	var product_name= $('#modalProductName').val();
	var manufac= $('#modalManufac').val();
	var product_value= $('#modalValue').val();
	var product_detail= $('#modaldetail').val();
	
	
	
	var param = {
			product_code : product_code,
			product_name : product_name,
			manufac : manufac,
			product_value : product_value,
			product_detail : product_detail
	};
	
	
	
	
	var callBackFunction = function(response){
		alert("등록 됐습니다");
		$("#myModal").hide();
	}
	
	if(product_code == '' || product_name == '' || manufac == '' || product_value == '' || product_detail == ''){
		alert("입력되지 않은 항목이 존재합니다.");
	}
	else {
		callAjax("/management/productRegist.do", "post", "text", false, param,callBackFunction);	
	}
}


function productUpdate(){ // 저장 버튼 클릭 시 분기되어 발동 (기존 내용 수정)
	var product_code = $('#modalProductCode').val();
	var product_name= $('#modalProductName').val();
	var manufac= $('#modalManufac').val();
	var product_value= $('#modalValue').val();
	var product_detail= $('#modaldetail').val();
	
	var product_codeOri = $('#modalProductCodeOrigin').val();
	var product_nameOri= $('#modalProductNameOrigin').val();
	var manufacOri= $('#modalManufacOrigin').val();
	var product_valueOri= $('#modalproductValueOrigin').val();
	var product_detailOri= $('#modalproductDetailOrigin').val();
	
	var test1 = product_code != product_codeOri ? product_code : '';
	var test2 = product_name != product_nameOri ? product_name : '';
	var test3 = manufac != manufacOri ? manufac : '';
	var test4 = product_value != product_valueOri ? product_value : '';
	var test5 = product_detail != product_detailOri ? product_detail : '';
		
	
	var param = {
			product_code : test1,
			product_name : test2,
			manufac : test3,
			product_value : test4,
			product_detail : test5,
			item_code : product_codeOri
	};
	
	var callBackFunction = function(response){
		alert("수정 됐습니다");
		$("#myModal").hide();
	}
	
	
	if(test1 == '' && test2 == '' && test3 == '' && test4 == '' && test5 == ''){//수정된 데이터가 없을 경우
		alert("수정된 내역이 없습니다.");
	}
	else{
		callAjax("/management/productUpdate.do", "post", "text", false, param,callBackFunction);	
	}
}


function productDelete(itemCode){ // 삭제 버튼 클릭 시 발동
	
	var param = {
			product_code : itemCode
	};
	
	var callBackFunction = function(response){
		alert("삭제 됐습니다");
		$("#myModal").hide();
	}
	
	callAjax("/management/productDelete.do", "post", "text", false, param,callBackFunction);
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
            overflow: hiddent;
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