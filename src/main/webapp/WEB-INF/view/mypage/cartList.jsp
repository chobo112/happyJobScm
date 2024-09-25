<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 갯수가 0인 경우  -->
<c:if test="${cnt eq 0 }">
	<tr>
		<td colspan="7">제품을 담아주세요.</td>
	</tr>
</c:if>

<!-- 갯수가 있는 경우  -->
<c:if test="${cnt > 0 }">
	<c:forEach items="${cartInfo}" var="list">
		<tr>
			<td>
				<input type="checkbox" class="checkbox" id="${list.item_code }" name="checkbox" onchange="javascript:checkboxChk(this)" >
			</td>
			<td>${list.equipment_type }</td>
			<td>${list.item_name }</td>
			<td>${list.manufac }</td>
			<td>
				<input type="text" class="inputTxt p100" name="count" value="${list.count }" onchange="javascript:countCheck(this)" >
			</td>
			<td id="total">${list.total }</td>
			<td>
				<a href="" class="deleteBtn btn_area" id="${list.item_code }" onclick="javascript:cartDelete(this)" style="cursor:pointer" >
					<span>X</span>
				</a>
			</td>
		</tr>
	</c:forEach>
</c:if>