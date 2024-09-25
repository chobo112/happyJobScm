<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

					
	<!-- 갯수가 0인 경우  -->
	<c:if test="${returnListCnt eq 0 }">
		<tr>
			<td colspan="4">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>
		
	<c:if test="${returnListCnt > 0 }">
		<c:forEach items="${returnList}" var="returnItem">
		    <tr>
		       	<td>${returnItem.return_order_date}</td>
		       	<td>${returnItem.item_name}</td>
		        <td>${returnItem.return_count}</td>
		        <td>
		        	<fmt:formatNumber value="${returnItem.return_price}" pattern="#,###"/>원
		        </td>
		        <td>${returnItem.signYN}</td>
		    </tr>
		    <c:set var="nRow" value="${nRow + 1}" /> 
		</c:forEach>
	</c:if>
	
	<input type="hidden" id="totcnt" name="totcnt" value="${returnListCnt}"/>
	