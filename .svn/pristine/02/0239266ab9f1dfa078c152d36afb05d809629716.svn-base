<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<c:if test="${returnAppPage eq 0 }">
		<tr>
			<td colspan="4">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>


	<c:if test="${returnAppPage > 0 }">
		<c:set var="nRow" value="${pageSize*(currentPage-1)}" />  
		<c:forEach items="${N}" var="list">
		    <tr>
		        <td style="color: red">${list.cust_name} (미승인)</td>
		        <td>${list.item_name}</td>
		        <td>${list.adr}</td>
		        <td>${list.return_count}</td>
		        <td><fmt:formatNumber value="${list.item_price}" pattern="#,### 원"/></td>
		        <td><fmt:formatNumber value="${list.sum}" pattern="#,### 원"/></td>
		       	<td>${list.return_order_date}</td>
		       	<td>${list.return_processing_date}</td>
		       	<td><a href="javascript:approvalModal(${list.seq}, 'tb_return');"><button>승인</button></a></td>
		    </tr>
		</c:forEach>
		<c:forEach items="${Y}" var="list">
		    <tr>
		        <td style="color: blue">${list.cust_name} (승인)</td>
		        <td>${list.item_name}</td> 
		        <td>${list.adr}</td>
		        <td>${list.return_count}</td>
		        <td><fmt:formatNumber value="${list.item_price}" pattern="#,### 원"/></td>
		        <td><fmt:formatNumber value="${list.sum}" pattern="#,### 원"/></td>
		       	<td>${list.return_order_date}</td>
		       	<td>${list.return_processing_date}</td>
		       	<td><button disabled>승인완료</button></td>
		    </tr>
		</c:forEach>
		<c:set var="nRow" value="${nRow + 1}" /> 
	</c:if>

<input type="hidden" id="retotcnt" name="retotcnt" value="${returnAppPage}"/>
