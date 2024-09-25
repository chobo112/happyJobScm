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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		warehouseList()
		registerBtnEvent()
	})
	
	function registerBtnEvent() {
		$("#searchBtn").click(function(e){
			e.preventDefault();
			warehouseList()
		});
		$("#newStorageSave").click(function(e){
			e.preventDefault();
			gfModalPop("#newStorageModal")
		});
		$("#adrFind").click(function(e){
			adrFind();
		});
		$("#btnNewStorage").click(function(e){
			if($("#storage_name").val() != "" && $("#storage_manager").val() != "" && $("#postCode").val() != "" && $("#address").val() != "" && $("#detailAddress").val() != ""){				
				newStorageSave();
			}else{
				alert("빈칸멈춰!")
			}
		});
	}
	
	function warehouseList() {
		
		var param = {
			searchSelect : $("#searchSelect").val(),
			searchTitle : $("#searchTitle").val()
		}

		var callBackFunction = function(res) {

			console.log(res)
			$("#storageList").empty().append(res);

		}

		callAjax("/management/warehouseList.do", "post", "text", false, param, callBackFunction);
	}
	
	function warehouseDetailModal(storage_code){
		var param = {
				storage_code : storage_code
		};

		var callBackFunction = function(res) {

			
			$("#warehouseInven").empty().append(res);
			
			gfModalPop("#warehouseDetailModal");
			
		}

		callAjax("/management/warehouseDetail.do", "post", "text", false, param, callBackFunction);
	}
	
	function adrFind(){
		  new daum.Postcode({
            oncomplete: function(data) {	     
            	
                var addr = ''; // 주소 변수
                               
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
              
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();           
            }
        }).open();
	}
	
	function newStorageSave(){
		
		var param = {
				storage_name : $("#storage_name").val(),
				storage_loc : $("#address").val(),
				storage_detail_loc : $("#detailAddress").val(),
				storage_loc_num : $("#postCode").val(),
				storage_manager : $("#storage_manager").val() 
				
		};

		var callBackFunction = function(res) {

			console.log(res)
		
		}

		callAjax("/management/newStorageSave.do", "post", "text", false, param, callBackFunction);
	}
	
	
</script>

<style type="text/css">
.storageInput{
	height: 68px;
}
.newStorage{
	 padding: 20px;
	 width: 225px;
}
.right{
	float: right;
	
}
.left{
	float: left;
	
}
.storageButton{
	width: 100px;
	margin: 0 auto;
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
								class="btn_nav bold">관리</a> <span class="btn_nav bold">창고정보관리</span>
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>


						<div>
							<p class="conTitle">
								<span>창고정보관리</span> 
								<span class="fr"> 
								<select id="searchSelect">
									<option value="name">창고명</option>
									<option value="address">창고위치</option>
								</select>
								<input type="text"
									id="searchTitle" name="searchTitle"
									style="height: 25px; margin-right: 10px;" />
									<a class="btnType red" href="" name="searchbtn" id="searchBtn"><span>검색</span></a>
									<a class="btnType red" href="" name="newStorageSave" id="newStorageSave"><span>창고 등록</span></a>
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
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div id="warehouseDetailModal" class="layerPop layerType2" style="width: 600px;">
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
					<tbody id="warehouseInven"></tbody>
				</table>
				
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	
	<div id="newStorageModal" class="layerPop layerType2" style="width: 533px;">
		<dl>
			<dt>
				<strong>새 창고 등록</strong>
			</dt>
			<div class="content">
				<!-- s : 여기에 내용입력 -->
				<div class="storageInput">
					<div class="newStorage left">
						<div>
							<label>창고이름</label>
							<input type="text" id="storage_name" style="width: 142px">
						</div>
						<div>
							<label>담 당 자</label>
							<input type="text" id="storage_manager">
						</div>
					</div>
					<div class="newStorage right">
						<div>
							<label>우편번호</label>
							<input type="text" id="postCode" disabled style="width: 90px">
							<button id="adrFind">주소찾기</button>
							<br>
							<label>주소</label>
							<input id="address" disabled style="width: 170px"> 
							<br>
							<label>상세주소</label>
							<input id="detailAddress" >				
						</div> 
					</div>				
				</div>
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnNewStorage" name="btn"><span>저장</span></a>					
					<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</div>
		</dl>
		
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>


</body>
</html>