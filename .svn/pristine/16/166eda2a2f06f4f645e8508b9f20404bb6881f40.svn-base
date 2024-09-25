<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <style>
        .layerPosition {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: white;
            padding: 20px;
            z-index: 1000;
        }
        .layerPop {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
        }
        .layerType2 {
            width: 500px;
            height: 300px;
        }
        .col {
            width: 100%;
            border-collapse: collapse;
        }
        .col td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .btn {
            margin: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        .btn-success {
            background-color: #28a745;
            color: white;
            border: none;
        }
    </style>
<script type="text/javascript">
var pageSize=5;
var pageBlockPage=10;

$(function(){
    registerBtnEvent();
    radioChange();
    returnList();
});

var type;

function radioChange() {
    $('input[type=radio][name="deliveryRadio"]').change(function() {
    	var type = $(this).val();
    	returnList(null, type);
    });
}

function returnList(cpage, type) {
    $("#insert").hide();
    $("#layer1").hide();
    
    cpage = cpage || 1;
    var param = {
        searchTitle: $("#searchTitle").val(),
        searchStDate: $("#searchStDate").val(),
        searchEdDate: $("#searchEdDate").val(),
        searchSelect: $("#searchSelect").val(), // 이 부분을 확인하여 실제 ID를 사용합니다.
        currentPage : cpage,
		pageSize : pageSize,
		type: type || null // type 매개변수를 optional로 만들어 기본값을 null로 설정합니다.
    };
	console.log(param);


    $.ajax({
        url: "/work/returnList.do",
        type: "post",
        dataType: "json",
        data: param,
        success: function(response) {
            var returnList = response.returnList;
            var html = "";
            var nRow = pageSize*(cpage -1);
            returnList.forEach(function(item, index) {
            	nRow++;
                html += "<tr>";
                html += "<td>" + item.seq + "</td>";
                html += "<td>" + item.item_code + "</td>";
                html += "<td>" + item.return_count + "</td>";
                html += "<td>" + item.return_order_date + "</td>";
                html += "<td>" + item.signYN + "</td>";
                html += "<td><a href='javascript:void(0);' onClick='returnDetail(" + item.seq + ",\"" + item.item_code + "\");' class='btn btn-secondary'>상세보기</a></td>";
                html += "</tr>";
            });

            $("#returnList").html(html);
            
            $("#totcnt").val(response.returnCnt);
			$("#nRow").val(nRow);
			$("#currentPage").val(cpage);
			
			var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "returnList")
			$("#pagingNavi").empty().append(pagieNavigateHtml);
			$("#currentPage").val(cpage);
			
			console.log("Total Count: ", response.returnCnt);
        }
    });
}



function returnDetail(seq, item_code) {
    var seqParam = { seq: seq };
    var itemCodeParam = { item_code: item_code };

    $("#modify").hide();
    $("#layer1").show();

    $.ajax({
        url: "/work/returnDetail.do",
        type: "post",
        dataType: "json",
        data: seqParam,
        success: function(response) {
            var returnDetail = response.returnDetail;
            var html = "";

            $("#returnDetail").empty();

            returnDetail.forEach(function(item) {
               	html+="<tr>";
                html += "<td>" + item.seq + "</td>";
                html += "<td>" + item.item_code + "</td>";
                html += "<td>" + item.return_order_date + "</td>";
                html += "<td>" + item.return_count + "</td>";
                html += "<td>" + item.refund_bank + "</td>";
                html += "<td>" + item.refund_bank_num + "</td>";
                html += "<td>" + item.refund_bank_name + "</td>";
                html += "<td>" + item.signYN + "</td>";
                if (item.signYN === 'N') {
                    html += "<td><button onClick='confirmReturn();' id='confirm'>반품 완료</button></td>";
                } else {
                    html += "<td></td>";
                }
                html+="</tr>";

                $("#seq").val(item.seq);
                $("#item_code").val(item.item_code);
                $("#return_count").val(item.return_count);
                
               /*  var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "productList")
    			$("#pagingNavi").empty().append(pagieNavigateHtml);
    			$("#currentPage").val(cpage); */
            });

            $("#returnDetail").append(html);
        }
    });
}

function confirmReturn() {
    var param = {
        seq: $("#seq").val(),
        item_code: $("#item_code").val(),
        return_count: $("#return_count").val()
    };

    $.ajax({
        url: "/work/confirm.do",
        type: "post",
        dataType: "json",
        data: param,
        success: function(response) {
            alert(response.resultMsg);
        }
    });

    $.ajax({
        url: "/work/modItemCount.do",
        type: "post",
        dataType: "json",
        data: param,
        success: function(response) {
            alert(response.resultMsg);
        }
    });
}

function registerBtnEvent() {
    $("#title").click(function() {
        $("#insert").toggle();
    });

    $("#close").click(function() {
        $("#layer1").hide();
    });

    $("#searchBtn").click(function(e) {
        e.preventDefault();
        returnList();
    });
    $("#modalTitle").click(function(){
    	$("#modify").toggle();
    })
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
					<!-- lnb 영역 --> <jsp:include
						page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">
						<p class="Location">
							<a href="#" class="btn_set home">메인으로</a> <a href="#"
								class="btn_nav bold">담당업무</a> <span class="btn_nav bold">발주서현황</span>
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<div><!-- 여기부터 내용 추가 -->
							<div class="deliveryList">
								<p class="conTitle">
									<span id="title">반품처리</span>
									<span class="fr">
										상품명
										<input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
										기간
										<input type="date" id="searchStDate" name="searchStDate" style="height: 25px; margin-right: 10px;"/> 
										~ 
										<input type="date" id="searchEdDate" name="searchEdDate" style="height: 25px; margin-right: 10px;"/>
										<a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
									</span>
								</p>
								<div class="radio">
									<input type="radio" value=""  name="deliveryRadio" checked>전체
									<input type="radio" value="ing" name="deliveryRadio">반품처리중
									<input type="radio" value="done" name="deliveryRadio">반품완
									<button id="insert">신규</button>
								</div>
								<div>
								<input type="hidden" id="" name="">
								<input type="hidden" id="totcnt" name="totcnt">
								<input type="hidden" id="nRow" name="nRow">
								
							</div>
								<table class="col">
									<caption>발주승인</caption>
									<colgroup>
										<col width="60px">
										<col width="100px">
										<col width="60px">
										<col width="120px">
										<col width="40px">
										<col width="40px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">반품번호</th>
											<th scope="col">상품명</th>
											<th scope="col">상품수량</th>
											<th scope="col">반품날짜</th>
											<th scope="col">반품결과</th>
											<th scope="col">상세보기</th>
										</tr>
									</thead>
									<tbody id="returnList"></tbody>
								</table>
								<div class="paging_area" id="pagingNavi"></div>
							</div>
						</div>
						
						
						
<!-- ----------------------------------------경계선----------------------------------------------- -->


						<div id="layer1" class="layerPosition layerPop layerType2" style="width: 500px; height: 300px">
							<div>
								<h1 id="modalTitle" onClick="practice();">반품 상세 조회</h1>
							</div>
							<br>
							<div>
								<table class="col">
									<tr>
										<td>반품코드</td>
										<td>상품코드</td>
										<td>반품신청일</td>
										<td>반품수량</td>
										<td>환불 은행</td>
										<td>환불 계좌</td>
										<td>환불 계좌명</td>
										<td>반품결과</td>
										<td></td>
									</tr>
									<tbody id="returnDetail">
										
									</tbody>
								</table>
								<div>
								<button onClick="modify" id="modify">수정</button>
								
								<button id="close" class="btn btn-success">닫기</button>
							</div>
							</div>
							<div>
								<input type="hidden" id="seq">
								<input type="hidden" id="item_code">
								<input type="hidden" id="return_count">
 							</div>
							<br>
							<br>
							
						</div>
						

<!-- ----------------------------------------------------------------------------------------------------------------- -->

						<div id="layer2" class="layerPosition layerPop layerType2" style="width: 500px; height: 500px">
							<div>
								<table>
									<tr>
										<td></td>
									</tr>
								</table>
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
</html>