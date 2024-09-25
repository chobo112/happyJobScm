<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 갯수가 0인 경우  -->
<c:if test="${cnt eq 0 }">
	<td colspan="7">반품 내역이 없습니다.</td>
</c:if>

<!-- 갯수가 있는 경우  -->
<c:if test="${cnt > 0 }">
	<c:forEach items="${list }" var="list">
		<tr>
			<td>${list.item_code }</td>
			<td>${list.item_name }</td>
			<td>${list.obtain_date }</td>
			<td>${list.return_count }</td>
			<td>
				<c:set var="returnPrice" value="${list.item_price * list.return_count }"></c:set>
				<fmt:formatNumber value="${returnPrice }" type="currency" currencySymbol="￦" />
			</td>
			<td>${list.return_order_date }</td>
			<td>${return_processing_date }</td>
		</tr>
	</c:forEach>
</c:if>

<input type="hidden" id="totcnt" name="totcnt" value="${cnt}"/>