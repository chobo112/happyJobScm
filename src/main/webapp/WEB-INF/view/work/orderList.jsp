<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<c:forEach items="${list}" var="order">
		<tr>
		    <td>${order.seq}</td>
			<td>${order.company_name}</td>
			<td>${order.product_name}</td>
			<td><fmt:formatNumber value="${order.item_price}" pattern="#,### 원"/></td>
			<td>${order.order_count}</td>
			<td><fmt:formatNumber value="${order.total_price}" pattern="#,### 원"/></td>
			<td><fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd" /></td>
			<c:if test="${order.signYN eq 'Y' }">
				<td style="color: blue">${order.signYN}</td>
			</c:if>
			<c:if test="${order.signYN eq 'N' }">
				<td style="color: red">${order.signYN}</td>
			</c:if>
			<c:if test="${order.depositYN eq 'Y' }">
				<td style="color: blue">${order.depositYN}</td>
			</c:if>
			<c:if test="${order.depositYN eq 'N' }"> 
				<td style="color: red">${order.depositYN}</td>
			</c:if>
			<c:if test="${order.depositYN eq 'N' and order.signYN eq 'Y'}">
				<td style="width: 20px"><a href="javascript:depositModal(${order.seq});"><button>입금</button></a></td>
			</c:if>
			
		</tr>
		 
	</c:forEach>

