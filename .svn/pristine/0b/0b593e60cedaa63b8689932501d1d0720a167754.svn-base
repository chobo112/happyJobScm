<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- 갯수가 0인 경우  -->
		<c:if test="${supplyCnt eq 0 }">
			<tr>
				<td colspan="4">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>



        <c:if test="${supplyCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
            <c:forEach var="list" items="${supply}">
                <tr>
                    <td class="custDetailView" data-custid2="${list.cust_id}"><a style="cursor:pointer;">${list.cust_name}</a></td>
                    <td>${list.loginID}</td>
                    <c:if  test="${list.password != '' && list.password != null  }" >
                		<td>*********</td>
                	</c:if>
                	<c:if  test="${list.password == '' || list.password eq null  }" >
                		<td>${list.password }</td>
                	</c:if>
                    <td>${list.cust_person}</td>
                    <td>${list.cust_person_ph}</td>
                </tr>
               <c:set var="nRow" value="${nRow + 1}" />
            </c:forEach>
        </c:if>
        
            
      
<script>
$(document).ready(function() {
	$(".custDetailView").click(function() {
		
		var callBackFunction = function(response){
	    	$("#custProduct").empty().append(response);
	    	$('.test').show();
	    }
	      
		
	    var param = { paramId : $(this).data('custid2')};
	    
	    callAjax("/management/custProduct.do", "post", "text", false, param,callBackFunction);
	});
    
});
</script>
    
    
