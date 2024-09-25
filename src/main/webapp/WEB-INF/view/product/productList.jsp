<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 갯수가 0인 경우  -->
<c:if test="${cnt eq 0 }">
	<tr>
		<td colspan="4">데이터가 존재하지 않습니다.</td>
	</tr>
</c:if>

<!-- 갯수가 있는 경우  -->
<c:if test="${cnt > 0 }">
	<c:forEach items="${productInfo}" var="list">
	<tr>
		<td id="item_code" style="display: none;"></td>
		<td>${list.equipment_type}</td>
		<td><a onclick="javascript:productDetailModal('${list.item_code}');">${list.item_name}</a></td>
		<td>${list.manufac}</td>
		<td>${list.item_price}</td>
		<td>
			<a onclick="javascript:productBuy('${list.item_code}');" class="btnType blue" id="btnBuy" name="btn" style="cursor:pointer"><span>구매</span></a> 
		</td>
	</tr>
	</c:forEach>
</c:if>

<!-- 이거 중간에 있으면 table 안먹힘  -->

<input type="hidden" id="totcnt" name="totcnt" value="${cnt}"/>