<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:forEach items="${list}" var="list" varStatus="i">
		<tr class="storageDetail">
			<td>${list.company_name}</td>		
			<td>${list.item_name}</td>
		</tr>
	</c:forEach>

	<c:forEach items="${select}" var="list">
			<option value="" selected disabled hidden></option>
			<option value="${list.item_code }">${list.item_name }</option>
	</c:forEach>
