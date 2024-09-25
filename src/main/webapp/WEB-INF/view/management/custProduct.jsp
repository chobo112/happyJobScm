<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


        <c:if test="${1 > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
            <c:forEach var="list" items="${productList}">                
									<tr>
							            <td>${list.item_code }</td>
							            <td>${list.item_name }</td>
							            <td>${list.item_price }</td>
							            <td>${list.obtain_count }</td>
									</tr>				    
               <c:set var="nRow" value="${nRow + 1}" />
            </c:forEach>
           </c:if>

<script>
$(document).ready(function() {
	
	
});

</script>
