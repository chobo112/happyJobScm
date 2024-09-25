<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:if test="${salesPage eq 0 }">
		<tr>
			<td colspan="4">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>

	<c:if test="${salesPage > 0 }">
		<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
		<c:forEach items="${list}" var="object">
		    <tr>
		        <td>${object.cust_name}</td>
		       	<td>${object.sales} 원</td>
		       	<td>${object.accounts_receivable } 원</td>
		        <td>${object.total_sum} 원</td>
		    </tr>
		</c:forEach>
		<c:set var="nRow" value="${nRow + 1}" /> 
	</c:if>

<input type="hidden" id="totcnt" name="totcnt" value="${salesPage}"/>