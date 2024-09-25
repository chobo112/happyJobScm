<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- 갯수가 0인 경우  -->
		<c:if test="${userCnt eq 0 }">
			<tr>
				<td colspan="4">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>



        <c:if test="${userCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
            <c:forEach var="list" items="${user}">
                <tr>
                	<c:choose>
                		<c:when test="${list.user_type eq 'B'}" >
                			<td class="detailView" data-loginid="${list.loginID}" data-usercode="${list.user_type}"  ><a style="cursor:pointer;">기업 고객</a></td> <!-- 사용자테이블에 있는 고객데이터 -->
                		</c:when>
                		<c:when test="${list.cust_person != null}" >
                			<td class="detailView" data-custid="${list.loginID}"  ><a style="cursor:pointer;">기업 고객</a></td> <!-- 기업테이블에 있는 고객데이터 -->
                		</c:when>
                	</c:choose>
                	<c:if  test="${list.user_type != 'B' && list.cust_person eq null  }" >
                		<td class="detailView" data-loginid="${list.loginID}"><a style="cursor:pointer;">내부 직원</a></td>
                	</c:if>
                    <td>${list.name}</td>
                    
                    <c:choose>
                    	<c:when test="${list.user_type eq 'A' }" >
                    		<td>임원</td>
                    	</c:when>
                    	<c:when test="${list.user_type eq 'B' }" >
                    		<td>고객</td>
                    	</c:when>
                    	<c:when test="${list.user_type eq 'C' }" >
                    		<td>SCM 관리자</td>
                    	</c:when>
                    	<c:when test="${list.user_type eq 'D' }" >
                    		<td>배송 담당자</td>
                    	</c:when>
                    	<c:when test="${list.user_type eq 'E' }" >
                    		<td>구매 담당자</td>
                    	</c:when>
                    	<c:when test="${list.user_type != 'A' && list.user_type != 'B' && list.user_type != 'C' && list.user_type != 'D' && list.user_type != 'E'  }" >
                    		<td>기타</td>
                    	</c:when>
                    </c:choose>
                    
                    <td>${list.cust_person}</td>
                    <td>${list.phone}</td>
                    
                </tr>
               <c:set var="nRow" value="${nRow + 1}" />
            </c:forEach>
        </c:if>
        
            
            <input type="hidden" id="totcnt" name="totcnt" value="${noticeCnt}"/>
      
<script>
$(document).ready(function() {
	
    $('.detailView').click(function() {
    	$("#deleteBtn").show();
    	$("#new").hide();
        var type = ($(this).data('custid') != 'undefined' && $(this).data('custid') != null) ? "기업고객" : "내부직원"; // 클릭된 요소의 type을 확인하고 저장
        var ucode = $(this).data('usercode');
        
        
        
        
        var callBackFunction = function(response){
    		$("#detail").empty().append(response);
    	}
        
        if(type == "기업고객" && ucode != 'B' ){ //기업 정보만 조회
        	var param =  {searchTitle : $(this).data('custid')};
        	callAjax("/management/custDetail.do", "post", "text", false, param,callBackFunction);
        }
        else { 	//기업 고객도 같이 조회
        	var param = { searchTitle : $(this).data('loginid')};
        	callAjax("/management/userDetail.do", "post", "text", false, param,callBackFunction);
        }
    });
});
</script>
    
    
