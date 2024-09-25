<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
					
		<!-- 갯수가 0인 경우  -->
		<c:if test="${deliveryListCnt eq 0 }">
			<tr>
				<td colspan="7">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		
	
	
	<c:if test="${deliveryListCnt > 0 }">
		<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
		
		<c:forEach items="${deliveryList}" var="deliveryItem">
		    <tr>
		       	<td>${deliveryItem.delivery_num}</td>
		       	<td>
		       		<fmt:formatDate pattern = "yyyy-MM-dd" value="${deliveryItem.delivery_date}"/>
		       	</td>
		       	<td>${deliveryItem.delivery_name}</td>
		        <td>${deliveryItem.delivery_start_loc}</td>
		        <td>${deliveryItem.delivery_end_loc}</td>
		        <td>${deliveryItem.obtain_count}</td>
		        <td>${deliveryItem.delivery_state}</td>
		    </tr>
		    <c:set var="nRow" value="${nRow + 1}" /> 
		</c:forEach>
	</c:if>
	
	
	<input type="hidden" id="totcnt" name="totcnt" value="${deliveryListCnt}"/>
	
