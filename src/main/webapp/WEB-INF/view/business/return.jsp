<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title> 공지사항  </title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">


	var pageSize = 5;
	var pageBlockPage = 10;

	$(document).ready(function() {
		returnList();//반품내역 조회
		searchBtnEvent();//검색버튼 조회결과
		
		$("#searchBtn").click(function(e){
			e.preventDefault();
			returnList();
		});
		
		$("#btnReturninsert").click(function() {
			insertREDelivery(); // 함수 호출
	    });
		
		changeEvent();
		$("#btnReturnUpdate").click(function() {
			returnUpdate();
		})
		
		$("#btnReturnClose").click(function() {
			gfCloseModal();
		})
		

		
		
	});
	
	// AJAX 함수 (배송원, 창고찾기용 ajax) => json데이터로 진짜 보내는 ajax
	function callMyAjax(url, method, dataType, async, param, successCallback) {
		//console.log("param : " + param.Storage_item_code)
		
	    $.ajax({
	        url: url,
	        type: method,
	        contentType: "application/json", // JSON 데이터를 보내기 위해 설정
	        dataType: dataType, // 서버로부터 JSON 응답을 받기 위해 설정
	        async: async,
	        data: JSON.stringify(param), // 파라미터를 JSON 문자열로 변환
	        success: function(data) {
	        	successCallback(data)
	        },
	        error: function(xhr, status, error) {
	        	console.log(param);
	            console.error("AJAX Error: " + status + error);
	        }
	        
	    });
	}
	
	function searchBtnEvent() {
		$("#searchBtn").click(function(event){
			event.preventDefault();
			returnList();
		})
	}
	
	// 날짜 유효성 검사 함수
	function validateDateRange() {
	    let searchStDate = $("#searchStDate").val();
	    let searchEdDate = $("#searchEdDate").val();

	    // 날짜가 선택되지 않았으면 아무 동작도 하지 않음
	    if (!searchStDate || !searchEdDate) {
	        return;
	    }

	    let stDate = new Date(searchStDate);
	    let edDate = new Date(searchEdDate);

	    // 종료일이 시작일보다 이전일 때 경고
	    if (edDate < stDate) {
	        alert("날짜를 다시 선택해주세요.");
	        $("#searchEdDate").val(""); // 잘못된 종료일 입력 필드 초기화
	    }
	}
	
	
	
	//유효성검사 => 실행시 => event 체인지 인 경우에 나오도록
	$(document).ready(function() {
	    $("#searchEdDate").on("change", validateDateRange);
	    $("#searchStDate").on("change", validateDateRange);
	});
          

	
	//첫화면 조회 + 페이징 처리
	function returnList(cpage) {
		
		cpage = cpage || 1;
		
		let param = {
				searchTitle : $("#searchTitle").val(),
				searchStDate : $("#searchStDate").val(),
				searchEdDate : $("#searchEdDate").val(),
				currentPage : cpage,
				pageSize : pageSize
		}
		
		
		/*
		var callBackFunction = function(res) {
			$("#returnList").empty().append(res);
			
		}*/
		
		var callBackFunction = function(res) {
	        $("#returnList").empty(); // 기존 내용을 비움
	        
	        if (res.trim() === "") { // res가 빈 문자열일 경우 .trim으로 잘라줘야됨
	            // 검색 결과가 없을 때 메시지 추가
	            $("#returnList").append('<tr><td colspan="10">검색한 데이터가 존재하지 않습니다.</td></tr>');
	        } else {
	            // 검색 결과가 있을 때, 결과 추가
	            $("#returnList").append(res);
	        }
	    }

		callAjax("/business/returnList.do", "post", "text", false, param, callBackFunction);
	}
	
		
	//배송지시서 모달에서 값 바꿔주기(input 수정시에)
	function changeEvent(){
		 $('#select_storage').change(function() {
			 $("#changestorageName").text($("#select_storage").val())
		 });
		 $('#insert_deliveryName').change(function() {
			 $("#changeDeliveryName").text($("#insert_deliveryName").val())
		 });
	}
	
	//배송모달에 값 붙여주기위해서
	function returnInsertModal(info) {
		 var parentRow = $(info).closest('tr'); // 클릭된 버튼의 부모 행을 찾습니다.
		    
		    var parentRow1 = parentRow.find("#return_item_name").text();
		    var parentRow2 = parentRow.find("#return_return_count").text();
		    var parentRow3 = parentRow.find("#total_price").text();
		    var parentRow4 = parentRow.find("#return_return_order_date").text();
		    var parentRow5 = parentRow.find("#return_return_processing_date").text();
		    var parentRow7 = parentRow.find("#return_signYN").text();
		    var parentRow8 = parentRow.find("#return_refund_bank").text();
		    var parentRow8 = parentRow.find("#return_refund_bank_num").text();
		    var parentRow8 = parentRow.find("#return_refund_bank_name").text();
		    var parentRow9 = parentRow.find("#return_cust_name").text();
		    var parentRow10 = parentRow.find("#return_item_code").text();
		    var parentRow11 = parentRow.find("#return_seq").text();
		    var parentRow12 = parentRow.find("#obtain_date").text();
		    var parentRow13 = parentRow.find("#cust_addr").text();
		    var parentRow14 = parentRow.find("#endloc").text();
		    
		    // 모달에 데이터 설정
		    $("#re_item_name").text(parentRow1);
		    $("#re_count").text(parentRow2);
		    $("#re_order_date").text(parentRow4);
		    $("#re_cust_name").text(parentRow9);									
		    $("#re_item_code").text(parentRow10);									
		    $("#re_seq").text(parentRow11);									
		    $("#re_obtain_date").text(parentRow12);									
		    $("#re_cust_addr").text(parentRow13);									
		    $("#re_endloc").text(parentRow14);									
		    
		    findStorage();
		    findDeliveryMan();
		    findreturnStatus();
		    selectDeliveryModal();
		    
		    $("#select_storage").empty();
	        $("#select_storage_count").val('');
	        $("#deliveryNum").empty();
		    
		gfModalPop("#returnInsertModal");
	}
	
	//창고가져오기
	function findStorage() {
		let param = {
				Storage_item_code : $("#return_item_code").text()
		}
	    //console.log("Parameter:", param); // param 객체를 출력하여 확인

		var callBackFunction = function(res) {
			console.log("창고 res : " + res);
	        // 셀렉트 박스를 비움
	        $("#select_storage").empty();
	        $("#select_storage").append('<option value="">창고선택</option>');
	        
	        // 서버로부터 받은 데이터를 셀렉트 박스에 추가
	        res.forEach(function(getStorageList) {
	            var option = $("<option></option>")
	                .attr("value", getStorageList.storage_name)
	                .text(getStorageList.storage_name);
	            $("#select_storage").append(option);
	            
	         // 셀렉트 박스 선택 시 해당 창고의 재고 수량을 보여줌
	            $("#select_storage").change(function() {
	                var selectedStorage = $(this).val();
	                var selectedStorageCount = 0;
	            });
	        });
		}
	    callMyAjax("/business/findStorage.do", "POST", "json", true, param, callBackFunction);
	}
	
	//배송원 찾기
	function findDeliveryMan() {
		let param = {	}
		var callBackFunction = function(res) {
			//console.log(res);
	        // 셀렉트 박스를 비움
	        $("#insert_deliveryName").empty();
	        $("#insert_deliveryName").append('<option value="">배송담당자</option>');
			
	        
	        // 서버로부터 받은 데이터를 셀렉트 박스에 추가
	        res.forEach(function(deliveryManList) {
	            var option = $("<option></option>")
	                .attr("value", deliveryManList.name)
	                .text(deliveryManList.name);
	            $("#insert_deliveryName").append(option);
	        });
		}
		
	    callMyAjax("/business/deliveryMan.do", "POST", "json", true, param, callBackFunction);
	}
	
	//배송지시서(반품) 등록 요청 함수
	function insertREDelivery() {
	    var data = {
			    delivery_end_loc: $('#re_endloc').text(),
			    obtain_count: $('#re_count').text(),
			    delivery_name: $('#insert_deliveryName').val(),
			    item_code : $('#re_item_code').text(),
			    storage_name : $('#select_storage').val(),
			    seq : $('#re_seq').text()
	    };

	    $.ajax({
	        url: '/business/RE_deliveryInsert.do', // 실제 서버의 URL
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(data),
	        success: function(response) {
	            if (response === 1) {
	                alert('배송지시서 등록 성공하였습니다.');
	                location.reload(); // 예시로 페이지 리로드
	                //작성버튼X
	            } else {
	                alert('배송지시서 등록 실패하였습니다.');
	            	//수정버튼 보이고
	            }
	        },
	        error: function(xhr, status, error) {
	            alert('배송지시서 등록 실패하였습니다: ' + error);
	        }
	    });
	}
	
	
	//모달 띄울때 수정인지, 작성인지 파악
	function findreturnStatus()  {
		let param = {	
				seq : $("#re_seq").text(),
		}
		
	    var callBackFunction = function(res) {
		    console.log("반품배송지시서 update=1, insert는 0이여야함 => " +  res); //res.deliverCnt
			console.log("좀 제대로 받아줘라 임마 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	        // deliveryCnt 값에 따라 테이블 바디 및 버튼 표시 설정
	        //res.findstatus
	        if (res === 0) {
	            $('#TableInsertOrUpdate').hide(); // 테이블 바디 숨기기
	            $('#btnReturninsert').show(); // 작성 버튼 보이기
	            $('#btnReturnUpdate').hide(); // 수정 버튼 숨기기
	        } else {
	            $('#TableInsertOrUpdate').show(); // 테이블 바디 보이기
	            $('#btnReturninsert').hide(); // 작성 버튼 숨기기
	            $('#btnReturnUpdate').show(); // 수정 버튼 보이기
                //updateDeliveryTable(res.deliveryUpdates); // 동적 테이블 업데이트
            }
	    };
	    
	    callMyAjax("/business/return_findstatusn.do", "POST", "json", true, param, callBackFunction);
	}

	//모달 => 수정버튼 update
	function returnUpdate() {
    if ($("#changeDeliveryName").text() === '' || $("#changeDeliveryName").text() === null || 
        $("#changestorageName").text() === '' || $("#changestorageName").text() === null) {
        alert('배송담당자와 창고이름을 확인해주세요');
        return;  // 함수 종료
    }

    let param = {
        delivery_num: $("#up_delivery_num").text(),
        delivery_name: $("#changeDeliveryName").text(),
        storage_name: $("#changestorageName").text()
    };

    let callBackFunction = function(res) {
        if(res === 0) {
            alert('수정에 실패하였습니다.');
            location.reload();
        } else {
            alert('수정에 성공하였습니다.');
            location.reload();
        }
    };

    callMyAjax("/business/deliveryUpdate.do", "POST", "json", true, param, callBackFunction);
}
	
	
	
	//배송지시서 1row select 할거임 => 모달창 띄울때 넣어주면 됨
	   function selectDeliveryModal() {
		    let param = {  
		        item_code: $("#re_item_code").text(),
		        obtain_date: $("#re_obtain_date").text().trim(),
		    	seq : $("#re_seq").text(),
		    };

		    // AJAX 호출 후 서버로부터 데이터를 받아 처리할 콜백 함수
		    let callBackFunction = function(response) {
		        console.log("서버에서 받은 데이터:", response);
		        
		        let tableBody = '';
		        if (response.length > 0) { // 배열의 길이 확인
		            let re_deliveryData = response[0]; // 첫 번째 객체 선택
		            
		         // delivery_date 형식화
		            let formattedDate = new Date(re_deliveryData.delivery_date).toLocaleDateString('ko-KR', {
		                year: 'numeric',
		                month: '2-digit',
		                day: '2-digit'
		            });
		            tableBody += '<tr>';
		            tableBody += '<td id="up_delivery_num">' + re_deliveryData.delivery_num + '</td>';
		            tableBody += '<td>' + formattedDate + '</td>';
		            tableBody += '<td>' + re_deliveryData.delivery_end_loc + '</td>';
		            tableBody += '<td id="changestorageName">' + re_deliveryData.storage_name + '</td>';
		            tableBody += '<td id="changeDeliveryName">' + re_deliveryData.delivery_name + '</td>';
		            tableBody += '</tr>';
		        } else {
		            tableBody += '<tr><td colspan="10">데이터가 없습니다.</td></tr>';
		        }
		        $('#deliveryTableBody').html(tableBody); // 테이블 업데이트
		    };
		    // AJAX 호출
		    callMyAjax("/business/return_deliverySelect.do", "POST", "json", true, param, callBackFunction);
		}
	


</script> 
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
						<p class="Location">
							<a href="#" class="btn_set home">메인으로</a> 
							<a href="#" class="btn_nav bold">시스템 관리</a> 
							<span class="btn_nav bold">공지 사항</span> 
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>
						
					<p class="conTitle">
						<span>거래내역</span> 
						<span class="fr">
                          반품제품명 <input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
						  기간
                          <input type="date" id="searchStDate" name="searchStDate" style="height: 25px; margin-right: 10px;"/> 
                          ~ 
                          <input type="date" id="searchEdDate" name="searchEdDate" style="height: 25px; margin-right: 10px;"/>
						  <a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
						</span>
					</p> 
						
							<Strong class="btn_nav bold">반품 현황</Strong> 
						
						<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="80px">
						                   <col width="50px">
						                   <col width="85px">
						                   <col width="120px">
						                   <col width="120px">
						                   <col width="100px">
						                   <col width="80px">
						                   <col width="90px">
						                   <col width="100px">
						                   <col width="120px">
					                 </colgroup>
								<thead>
									<tr>
							              <th scope="col">반품 제품명</th>
							              <th scope="col">반품 수량</th>
							              <th scope="col">반품 금액</th> 
							              <th scope="col">반품 신청일</th>
							              <th scope="col">반품 완료일</th>
							              <th scope="col">반품승인여부</th>
							              <th scope="col">은행명</th>
							              <th scope="col">계좌번호</th>
							              <th scope="col">담당자</th>
							              <th scope="col">배송지시서(반품용) 작성</th>
									</tr>

								</thead>
								<tbody id="returnList"></tbody>
							</table>

							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingNavi">
							</div>
											
						</div>

		
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 반품 배송 모달팝업 -->
 		<div id="returnInsertModal" class="layerPop layerType2" style="width:60rem; height: 25rem;">
			<dl>
				<dt><strong>배송지시서 작성</strong></dt>
				<dd class="content">
					<div style="margin-bottom: 1rem;">
						<table class='col'>
							<thead>
								<tr>
									<th scope='col'>반품신청 일자</th>
									<th  style="display:none" scope='col'>배송일자</th> 
									<th scope='col'>기업명</th>
									<th scope='col'>제품명</th>
									<th scope='col'>반품수량</th>
									<th scope='col'>배송담당자(input태그)</th>
									<th scope='col'>창고선택(input태그)</th>
									<th scope='col'>제품번호</th>
								</tr>
							</thead>
							<tbody id = ''>
								<tr>
									<td  style="display:none" id = 're_order_date'></td>
									<td  style="display:none" id = 're_endloc'></td>
									<td id = 're_obtain_date'></td>
									<td id = 're_cust_name'></td>
									<td id = 're_item_name'></td>
									<td id = 're_count'></td>
									<td id = 'Delivery_name'>
								        <select name="" id="insert_deliveryName">
								            <option value="">배송담당자</option>
								        </select>
							        </td>
							        <td>
								        <select name="select_storage" id="select_storage">
								 			 <option value="">창고선택</option>
										</select>
									</td>
									<td id = 're_item_code'></td>
									<td style="display:none" id = 're_cust_addr'></td>
									<td style="display:none" id = 're_seq'></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					

					<div id="TableInsertOrUpdate" style="height: 6rem;">
						<table class='col'>
							<thead>
								<tr>
									<th scope='col'>배송번호</th>
									<th scope='col'>배송일자</th>
									<th scope='col'>출발지</th>
									<th scope='col'>도착지</th>
									<th scope='col'>배송담당자</th>
								</tr>
							</thead>
							<tbody id = "deliveryTableBody">
							</tbody>
						</table>
					</div>

					<div class="btn_areaC mt30">
						<a class="btnType blue" id="btnReturninsert" name="btn"><span>작성</span></a>
						<a class="btnType blue" id="btnReturnUpdate" name="btn"><span>수정</span></a>
						<a class="btnType gray" id="btnReturnClose" name="btn"><span>닫기</span></a>
					</div>
				</dd>

			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>			
		</div>
	

</body>
</html>
