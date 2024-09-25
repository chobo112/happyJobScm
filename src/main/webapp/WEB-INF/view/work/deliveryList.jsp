<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<c:forEach items="${list}" var="list">
		<tr>
		    <td>${list.delivery_num}</td>
			<td>${list.delivery_name}</td>
			<td>${list.storage_name}</td>
			<td>${list.delivery_end_loc }</td>
			<c:if test="${list.delivery_state eq '배송중'}">
				<td style="color: blue">${list.delivery_state}</td>
			</c:if>
			<c:if test="${list.delivery_state eq '배송완료'}">
				<td style="color: green;">${list.delivery_state}</td>
			</c:if>
			<td><a href="javascript:deliveryModal(${list.delivery_num});"><button>상세보기</button></a></td>
		</tr>
		 
	</c:forEach>

