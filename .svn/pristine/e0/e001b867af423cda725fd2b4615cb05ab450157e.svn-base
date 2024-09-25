<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- 갯수가 0인 경우  -->
		<c:if test="${codeCnt eq 0 }">
			<tr>
				<td colspan="4">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>



        <c:if test="${codeCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
            <c:forEach var="list" items="${codeList}"  varStatus="status">
                <tr class="global">
                    <td id="codeDetailView" >${status.index + 1}</td>
                    <td class="groupCode" data-groupcode="${list.group_code}">${list.group_code}</td>
                    <td class="detailCode" data-detailcode="${list.detail_code}">${list.detail_code}</td>
                    <td class="detailName" data-detailname="${list.detail_name}">${list.detail_name}</td>
                    <td class="detailYn" data-detailyn="${list.use_yn}">${list.use_yn}</td>
                    <td class="detailAdjust" data-detailid="${list.detail_code}"><button class="detailAdjustBtn">수정</button></td>
                </tr>
               <c:set var="nRow" value="${nRow + 1}" />
            </c:forEach>
        </c:if>
        
            
      
<script>

var global_group_code = '';

$(document).ready(function() {

	
	
	$(document).on('click', '.detailAdjustBtn', function() {  //상세코드의 수정버튼 클릭
		var row = $(this).closest("tr");
		$(".btn1").show();
		$("#myModal2").show();
        
        // 행의 데이터 추출
        var detailCode = row.find(".detailCode").data('detailcode');
        var detailName = row.find(".detailName").data('detailname');
        var detailYn = row.find(".detailYn").data("detailyn");
        
        $("#detailCodeModal").val(detailCode);
        $("#detailCodeModalOrigin").val(detailCode);
		$("#detailCodeNameModal").val(detailName);
		$("#detailCodeNameModalOrigin").val(detailName);
			
		 
		if(detailYn == 'Y'){
			$("input[name='detailcodeRadio'][value=0]").prop("checked", true); //yes 채크
			$("#detailYnOrigin").val(detailYn);
		} else {
			$("input[name='detailcodeRadio'][value=1]").prop("checked", true); // no 채크
			$("#detailYnOrigin").val(detailYn);
		}
	});
	
	
	$(".close").click(function() { //X클릭
    	$("#myModal2").hide();
    	global_group_code = '';
    });
	
	$(".btnDtail").click(function() { //취소 버튼
    	$("#myModal2").hide();
    	global_group_code = '';
    });
	
	$(".btn1Dtail").click(function() { // 삭제 버튼
		comDetailCodeDelete();
	});
	    
	$(".btn2Dtail").click(function() { // 저장 버튼 클릭 시 발동
	  	if( $('#detailCodeModalOrigin').val() == ''){
	   		comDetailCodeRegist(); //신규 저장
	   	}
	   	else {
	   		comDetailCodeAdjust(); // 기존 내역 수정 저장
	   	}
	});
	
	$("#newDetailRegister").click(function() {
	  	$(".detailbtn1").hide();
	   	$("#myModal2").show();
	   	$('#detailCodeModal').val('');
	   	$('#detailCodeNameModal').val('');
	   	$('#detailyn1').prop('disabled');
	   	$('#detailCodeModalOrigin').val('');
	});
	
	
});

$(function(){
	var row = $('.global').closest("tr");
    var group_code = row.find('.groupCode').data('groupcode');
    
    global_group_code = group_code; //전역 변수 초기화
})

function comDetailCodeAdjust(){  // 저장 버튼 이벤트로 실행
	var detail_code = $('#detailCodeModal').val();
	var detail_name= $('#detailCodeNameModal').val();
	var checked = $('#detailyn1').prop('checked') == true ? 'Y' : 'N';
	
	var detail_codeOri = $('#detailCodeModalOrigin').val();
	var detail_nameOri= $('#detailCodeNameModalOrigin').val();
	var checkedOri = $('#detailYnOrigin').val();
	
	var test1 = detail_code != detail_codeOri ? detail_code : '';
	var test2 = detail_name != detail_nameOri ? detail_name : '';
	var test3 = checked != checkedOri ? checked : '';
	

	
	var param = {
		detail_code : test1,
		detail_name : test2,
		use_yn : test3,
		detail_id : detail_codeOri
	};
	
	var callBackFunction = function(response){
		alert("수정 됐습니다");
	}
	
	callAjax("/management/comDetailCodeAdjust.do", "post", "text", false, param,callBackFunction);
}


function comDetailCodeRegist(){ // 상세코드 모달의 저장 버튼 이벤트로 실행
	var detail_code = $('#detailCodeModal').val();
	var detail_name= $('#detailCodeNameModal').val();
	var checked = $('#detailyn1').prop('checked') == true ? 'Y' : 'N';
	var group_code = global_group_code;
	
	
	var param = {
			group_code : group_code,
			detail_code : detail_code,
			detail_name : detail_name,
			use_yn : checked
	};
	
	
	
	var callBackFunction = function(response){
		alert("등록 됐습니다");
	}
	
	callAjax("/management/comDetailCodeRegist.do", "post", "text", false, param,callBackFunction);
}


function comDetailCodeDelete(){ //삭제 기능
	var detail_codeOri = $('#detailCodeModalOrigin').val();
	
	var param = {
			detail_code : detail_codeOri
	};
	
	var callBackFunction = function(response){
		alert("삭제 됐습니다");
	}
	
	callAjax("/management/comDetailCodeDelete.do", "post", "text", false, param,callBackFunction);
}


</script>
    
    
