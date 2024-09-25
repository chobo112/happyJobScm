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
                <tr>
                    <td id="codeDetailView" >${status.index + 1}</td>
                    <td class="groupCode" data-groupcode="${list.group_code}"><a style="cursor:pointer;">${list.group_code}</a></td>
                    <td class="groupName" data-groupname="${list.group_name}">${list.group_name}</td>
                    <td class="groupYn" data-groupyn="${list.use_yn}">${list.use_yn}</td>
                    <td>${list.reg_date}</td>
                    <td class="adjust" data-groupid="${list.group_code}"><button class="adjustBtn">수정</button></td>
                    
                </tr>
               <c:set var="nRow" value="${nRow + 1}" />
            </c:forEach>
        </c:if>
        
            
      
<script>
$(document).ready(function() {
	
	
	$(document).on('click', '.adjustBtn', function() {
		var row = $(this).closest("tr");
		$(".btn1").show();
		$("#myModal").show();
        
        // 행의 데이터 추출
        var groupCode = row.find(".groupCode").data('groupcode');
        var groupName = row.find(".groupName").data("groupname");
        var groupYn = row.find(".groupYn").data("groupyn");
        var regDate = row.find("td:nth-child(5)").text(); // 등록일 텍스트 추출

        
        $("#groupCodeModal").val(groupCode);
        $("#groupCodeModalOrigin").val(groupCode);
		$("#groupCodeNameModal").val(groupName);
		$("#groupCodeNameModalOrigin").val(groupName);
		
		 
		if(groupYn == 'Y'){ //라디오 ㅂ ㅓ튼의  선택 유무를 가져오기
			$("input[name='codeRadio'][value=0]").prop("checked", true); //yes가 선택된 상태일 경우
			$("#groupYnOrigin").val(groupYn);
		} else {
			$("input[name='codeRadio'][value=1]").prop("checked", true); // no가 선택도니 상태일 경우
			$("#groupYnOrigin").val(groupYn);
		}
		
	});
	
	$('.groupCode').click(function() {
		 var groupCode = $(this).data('groupcode');
		 getDetailCodeList(groupCode);
		 $('.divDetailList2').show();
	});
	 
});

function getDetailCodeList(groupCode){

	
	var param = {		
			group_code : groupCode
	};
	
	var callBackFunction = function(response){
		$("#detailCodeView").empty().append(response);
	}
	
	callAjax("/management/getDetailCodeList.do", "post", "text", false, param,callBackFunction);
}


</script>
    
    