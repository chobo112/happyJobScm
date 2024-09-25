<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<!-- 부트스트랩 CSS 이거 하면 터짐..
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
-->

<script type="text/javascript">
	var findStatus;// = $("#findStatus"); 
	var pageSize = 5;
	var pageBlockPage = 10;
	
	//수주리스트 불러오기
	$(function() {
		//밑은 배송에 관한 js
		obtainList();
		//orderList();
		searchBtnEvent();
		
		$("#searchBtn").click(function(e){
			e.preventDefault();
			obtainList();
		});
		
		
		$("#btnDeliveryinsert").click(function() {
			insertDelivery();
	    });
		
		changeEvent();
		$("#btnDeliveryUpdate").click(function() {
			deliveryUpdate();
		})
		$("#btnDeliveryClose").click(function() {
			gfCloseModal();
		})

		
	})
	
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
	        alert("종료일이 시작일보다 이전입니다. 날짜를 다시 선택해주세요.");
	        $("#searchEdDate").val(""); // 잘못된 종료일 입력 필드 초기화
	    }
	}

	// 종료일(EDate) 변경 이벤트 핸들러 등록
	$(document).ready(function() {
	    $("#searchEdDate").on("change", validateDateRange);
	});
	
	function searchBtnEvent() {
		$("#searchBtn").click(function(event){
			event.preventDefault();
			obtainList();
		})
	}
	
	//수주내역 전체 리스트
	function obtainList(cpage) {
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
			$("#obtainList").empty().append(res);
		}
		*/
		
		var callBackFunction = function(res) {
	        $("#obtainList").empty(); // 기존 내용을 비움
	        
	        if (res.trim() === "") { // res가 빈 문자열일 경우 .trim으로 잘라줘야됨
	            // 검색 결과가 없을 때 메시지 추가
	            $("#obtainList").append('<tr><td colspan="8">검색한 데이터가 존재하지 않습니다.</td></tr>');
	        } else {
	            // 검색 결과가 있을 때, 결과 추가
	            console.log(res);
	            console.log("왜 다 사라지고 있니?? 데이터는 들어있냐?"+res);
	            $("#obtainList").append(res);
				var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "obtainList");
				$("#pagingNavi").empty().append(pagieNavigateHtml);
				$("#currentPage").val(cpage);	            
	            
	        }
	    }
		
		callAjax("/business/obtainList.do", "post", "text", false, param, callBackFunction);
	}
	
	//여기서부터는 배송에 관한 js
	//배송지시서 버튼 클릭시 데이터 값 넘겨지면서 모달창 나옴
	function deliveryModal(info) {
	    var parentRow = $(info).closest('tr'); // 클릭된 버튼의 부모 행을 찾습니다.
	    
	    var parentRow1 = parentRow.find("#obtain_seq").text();
	    var parentRow2 = parentRow.find("#obtain_obtain_date").text();
	    var parentRow3 = parentRow.find("#obtain_cust_name").text();
	    var parentRow4 = parentRow.find("#obtain_item_name").text();
	    var parentRow5 = parentRow.find("#obtain_obtain_count").text();
	    var parentRow6 = parentRow.find("#obtain_depositYN").text();
	    var parentRow7 = parentRow.find("#obtain_item_code").text();
	    var parentRow8 = parentRow.find("#obtain_addr").text();
	    var parentRow9 = parentRow.find("#obtain_inventory_count").text();

	    $("#seq").empty();
	    $("#obtain_date").empty();
	    $("#cust_name").empty();
	    $("#item_name").empty();
	    $("#obtain_count").empty();
	    $("#depositYN").empty();
	    $("#item_code").empty();
	    $("#addr").empty();
	    $("#inventory_count").empty();
	    
	    
	    // 모달에 데이터 설정
	    $("#seq").text(parentRow1);
	    $("#obtain_date").text(parentRow2);
	    $("#cust_name").text(parentRow3);
	    $("#item_name").text(parentRow4);
	    $("#obtain_count").text(parentRow5);
	    $("#depositYN").text(parentRow6);
	    $("#item_code").text(parentRow7);
	    $("#addr").text(parentRow8);
	    $("#inventory_count").text(parentRow9);
	    
	    
	    //배송원조회
	    findDeliveryMan();
   		//창고조회-제품이 있는
	    findStorage();
	    
   		//1이면 수정, 0이면 작성
	    finddataStatus();
   		//배송지시서 모달에 데이터붙이기
	    
   		selectDeliveryModal();
   		
	    $("#select_storage").empty();
        $("#select_storage_count").val('');
        $("#deliveryNum").empty();
	    gfModalPop("#deliveryPop");
	    
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
	        	//console.log(param);
	            //console.log("AJAX Error: " + status + error);
	        }
	        
	    });
	}
	
	//창고찾기
	function findStorage() {
		//console.log($("#item_code").text());
		let param = {
				Storage_item_code : $("#item_code").text()
		}
	    //console.log("Parameter:", param); // param 객체를 출력하여 확인

		var callBackFunction = function(res) {
			
	        // 셀렉트 박스를 비움
	        $("#select_storage").empty();
	        $("#select_storage_count").empty();
	        $("#select_storage").append('<option value=""></option>');
			
	        
	        // 서버로부터 받은 데이터를 셀렉트 박스에 추가
	        res.forEach(function(getStorageList) {
	            var option = $("<option></option>")
	                .attr("value", getStorageList.storage_code)
	                .text(getStorageList.storage_name);
	            $("#select_storage").append(option);
	            
	            
	         // 셀렉트 박스 선택 시 해당 창고의 재고 수량을 보여줌
	            $("#select_storage").change(function() {
	                var selectedStorage = $(this).val();
	                var selectedStorageCount = getStorageList.inventory_count;
	               
	                // 선택한 창고의 재고 수량을 찾아서 입력
	                res.forEach(function(getStorageList) {
	                    if (getStorageList.storage_code === selectedStorage) {
	                        selectedStorageCount = getStorageList.inventory_count;
	                        return false; // 반복문 종료
	                    }
	                });
	            
	                // 재고 수량을 input 필드에 입력
	                $("#select_storage_count").val(selectedStorageCount);
	            });
	        });
	        //getStorageList.inventory_count=10
	        //$('select_storage_count')
		}
	    
	    callMyAjax("/business/findStorage.do", "POST", "json", true, param, callBackFunction);
	}
	
	//모달 띄울때 수정인지, 작성인지 파악
	function finddataStatus()  {
	    
	    let param = {    
	        item_code : $("#item_code").text(),
	        obtain_date : $("#obtain_date").text(),
	    }
	    
	    var callBackFunction = function(res) {
	        console.log("데이터값이 뭘로 넘어왔을까 update=1, insert는 0이여야함 " +  res); //res.deliverCnt
	        console.log(res); //res.deliverCnt

	        // deliveryCnt 값에 따라 테이블 바디 및 버튼 표시 설정
	        if (res.status === 0) {
	            $('#TableInsertOrUpdate').hide(); // 테이블 바디 숨기기
	            $('#btnDeliveryinsert').show(); // 작성 버튼 보이기
	            $('#btnDeliveryUpdate').hide(); // 수정 버튼 숨기기
	        } else {
	            $('#TableInsertOrUpdate').show(); // 테이블 바디 보이기
	            $('#btnDeliveryinsert').hide(); // 작성 버튼 숨기기
	            $('#btnDeliveryUpdate').show(); // 수정 버튼 보이기
	        }
	    }
	    
	    callMyAjax("/business/findstatus.do", "POST", "json", true, param, callBackFunction);
	}

	
	// 배송지시서 등록 요청 함수
	function insertDelivery() {
		/*
		if ($("#changeDeliveryName").val() === '' || $("#changeDeliveryName").val() === null && 
				$("#changestorageName").val() === '' || $("#changestorageName").val() === null) {
			alert('배송담당자와 창고이름을 확인해주세요')	
		    return;  // 함수 종료
		}*/
		
	    var data = {
		    delivery_end_loc: $('#addr').text(),
		    obtain_count: $('#obtain_count').text(),
		    delivery_name: $('#insert_deliveryName').val(),
		    item_code : $('#item_code').text(),
		    storage_code : $('#select_storage').val(),
		    seq : $('#seq').text()
	    };
	   
	    $.ajax({
	        url: '/business/deliveryInsert.do', // 실제 서버의 URL
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(data),
	        success: function(response) {
	            if (response === 1) {
	                alert('배송지시서 등록 성공하였습니다.');
	                location.reload(); // 예시로 페이지 리로드
	            } else {
	                alert('배송지시서 등록 실패하였습니다.');
	            }
	        },
	        error: function(xhr, status, error) {
	            alert('배송지시서 등록 실패하였습니다: ');
	        }
	    });
	    
	}
		//모달 선택시에 창고 및 배송기사 체인지
		function deliveryUpdate() {
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
	          
	
	
	// 배송지시서 1row select => 모달창 띄울때 넣어주면 됨
    function selectDeliveryModal() {
        let param = {
            item_code: $("#item_code").text(),
            obtain_date: $("#obtain_date").text().trim()
        };

        // AJAX 호출 후 서버로부터 데이터를 받아 처리할 콜백 함수
        let callBackFunction = function(response) {
            console.log("서버에서 받은 데이터:", response);
            let tableBody = '';
            if (response.length > 0) { // 배열의 길이 확인
                let re_deliveryData = response[0]; // 첫 번째 객체 선택
                tableBody += '<tr>';
                tableBody += '<td id="up_delivery_num">' + re_deliveryData.delivery_num + '</td>';
                tableBody += '<td>' + re_deliveryData.delivery_dateFMT + '</td>';
                tableBody += '<td>' + re_deliveryData.item_name + '</td>';
                tableBody += '<td>' + re_deliveryData.obtain_count + '</td>';
                tableBody += '<td>' + re_deliveryData.storage_name + '</td>';
                tableBody += '<td>' + re_deliveryData.storage_loc + '</td>';
                tableBody += '<td>' + re_deliveryData.delivery_end_loc + '</td>';
                tableBody += '<td>' + re_deliveryData.delivery_name + '</td>';
                tableBody += '</tr>';
            } else {
                tableBody += '<tr><td colspan="8">데이터가 없습니다.</td></tr>';
            }
            $('#deliveryTableBody').html(tableBody); // 테이블 업데이트
        };

        // AJAX 호출
        callMyAjax("/business/deliverySelectUpdate.do", "POST", "json", true, param, callBackFunction);
    }
		
		
		//배송지시서 모달에서 값 바꿔주기(input 수정시에)
		function changeEvent(){
			 $('#select_storage').change(function() {
				 $("#changestorageName").text($("#select_storage").text())
			 });
			 $('#insert_deliveryName').change(function() {
				 $("#changeDeliveryName").text($("#insert_deliveryName").val())
			 });
		}
		
</script>
</head>
<body>
  <form id="myForm" action="" method=""><!--폼으로 전체 감싼거-->

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
						<span>수주현황</span> 
						<span class="fr">
                          고객기업명<input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
						  기간
                          <input type="date" id="searchStDate" name="searchStDate" style="height: 25px; margin-right: 10px;"/> 
                          ~ 
                          <input type="date" id="searchEdDate" name="searchEdDate" style="height: 25px; margin-right: 10px;"/>
						  <a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
						</span>
					</p> 
						
						<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="50px">
						                   <col width="100px">
						                   <col width="50px">
						                   <col width="40px">
						                   <col width="40px">
						                   <col width="40px">
						                   <col width="40px">
						                   <col width="40px">
					                 </colgroup>
								<thead>
									<tr >
							              <th scope="col">주문번호</th>
							              <th scope="col">주문일자</th>
							              <th scope="col">고객기업명</th>
							              <th scope="col">주문제품명</th>
							              <th scope="col">주문개수</th>
							              <th scope="col">재고개수</th>
							              <!-- <th scope="col">반품요청 여부</th>
							              <th scope="col">반품처리일자</th> -->
							              <th scope="col">입금여부</th>
							              <th scope="col">배송지시서 작성</th>
									</tr>

								</thead>
								<tbody id="obtainList"></tbody>
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
	
	
		
		<!-- 배송 모달팝업 -->
 		<div id="deliveryPop" class="layerPop layerType2" style="width:60rem; height: 25rem;">
			<dl>
				<dt><strong>배송지시서 작성</strong></dt>
				<dd class="content">
					<div style="margin-bottom: 1rem;">
						<table class='col'>
							<thead>
								<tr>
									<th scope='col'>주문번호</th>
									<th scope='col'>주문일자</th>
									<th scope='col'>기업명</th>
									<th scope='col'>제품명</th>
									<th scope='col'>주문수량</th>
									<th scope='col'>배송담당자(input태그)</th>
									<th scope='col'>입금여부</th>
								</tr>
							</thead>
							<tbody id='deliveryModalInfo'>
						    <tr>
						        <td id='seq'></td>
						        <td id='obtain_date'></td>
						        <td id='cust_name'></td>
						        <td id='item_name'></td>
						        <td id='obtain_count'></td>
						        <td>
						            <select name='' id='insert_deliveryName'>
						                <option value=''>배송담당자</option>
						            </select>
						        </td>
						        <td id='depositYN'></td>
						        <td style='display:none' id='item_code'></td>
						        <td style='display:none' id='addr'></td>
						        <td style='display:none' id='deliveryNum'></td>
								<td style='display:none' id='changestorageName'></td>
								<td style="display:none" id='changeDeliveryName'></td>

						    </tr>
						</tbody>

						</table>
					</div>
					
					<!-- 창고정보 -->
					<div id = "whInfo" style="margin-bottom: 1rem; display: flex; justify-content: space-around; align-items: baseline;">
						
						<select name="select_storage" id="select_storage" >
							  <option value="storage_code">창고선택</option>
						</select>
						
						<span>재고수량</span><input id="select_storage_count" type="text" class = "totalStock" readonly="readonly" style="width: 180px; height: 30px;" />
<!-- 						<a class="btnType blue" id="btnBDirec" name="btn" onClick = "appendDetail('b')"><span>선택확인</span></a>
 -->					</div>
					<div id="deli" style="display: none;"></div>
					
					<div id="TableInsertOrUpdate" style="height: 6rem;">
						<table class='col'>
							<thead>
								<tr>
									<th scope='col'>배송번호</th>
									<th scope='col'>배송일자</th>
									<th scope='col'>제품명</th>
									<th scope='col'>배송수량</th>
									<th scope='col'>배송창고</th>
									<th scope='col'>출발지역</th>
									<th scope='col'>배송지</th>
									<th scope='col'>배송담당자</th>

								</tr>
							</thead>
							<tbody id = "deliveryTableBody">
							</tbody>
						</table>
					</div>

					<div class="btn_areaC mt30">
						<a class="btnType blue" id="btnDeliveryinsert" name="btn"><span>작성</span></a>
						<a class="btnType blue" id="btnDeliveryUpdate" name="btn"><span>수정</span></a>
						<a class="btnType gray" id="btnDeliveryClose" name="btn"><span>닫기</span></a>
					</div>
				</dd>

			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>			
		</div>

	
  </form>
</body>
</html>
