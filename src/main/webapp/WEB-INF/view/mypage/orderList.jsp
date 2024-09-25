<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 갯수가 0인 경우  -->
<c:if test="${cnt eq 0 }">
	<td colspan="7">구매 내역이 없습니다.</td>
</c:if>

<!-- 갯수가 있는 경우  -->
<c:if test="${cnt > 0 }">
	<c:forEach items="${orderList}" var="list">
		<tr>
			<td>${list.item_code }</td>
			<td>${list.item_name }</td>
			<td>${list.obtain_date }</td>
			<td>${list.obtain_count }</td>
			<td>
				<c:set var="price" value="${list.obtain_count * list.item_price }"></c:set>
				<fmt:formatNumber value="${price }" type="currency" currencySymbol="￦" /> 
			</td>
			<td id="deliveryDate">${list.delivery_date }</td>
			<td>
				<c:choose>
					<c:when test="${list.returnYN eq 'Y' }">
						<button disabled>반품</button>
					</c:when>
					<c:otherwise>
						<button onclick="javascript:returnBtn(${list.seq}, this)">반품</button>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</c:forEach>
</c:if>

<input type="hidden" id="totcnt" name="totcnt" value="${cnt}"/>