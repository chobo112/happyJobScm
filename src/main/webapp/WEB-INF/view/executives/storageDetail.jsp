<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:forEach items="${list}" var="object" varStatus="i">
		<tr class="storageDetail">
			<td style="text-align: center;"><input value="${object.storage_name}" disabled style="width: 70px; border: 1px solid white; "/></td>		
			<td style="text-align: center;"><input value="${object.item_name}" disabled style="width: 70px; border: 1px solid white;"/></td>		
			<td style="text-align: right;"><input value="${object.item_price} 원" disabled style="width: 70px; border: 1px solid white;text-align: right;"/></td>		
			<td style="text-align: right;"><input value="${object.inventory_count}"  disabled style="width: 70px; border: 1px solid white;text-align: right;"/></td>		
		</tr>
	</c:forEach>

