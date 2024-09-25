<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:forEach items="${list}" var="object">
		<tr>
		    <td>${object.storage_code}</td>
			<td><a href="javascript:warehouseDetailModal(${object.storage_code});">${object.storage_name}</a></td>
			<td>${object.storage_loc}</td>
			<td>${object.storage_manager}</td>
			<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
		</tr>
		 
	</c:forEach>

