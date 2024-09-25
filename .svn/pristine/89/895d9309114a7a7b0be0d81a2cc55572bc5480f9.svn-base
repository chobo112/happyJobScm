<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<c:forEach items="${list}" var="object" varStatus="i" begin="0" end="9">
	    <tr>
	        <td> ( ${i.count } ) ${object.cust_name}</td>
	       	<td><fmt:formatNumber value="${object.sales}" pattern="#,### 원"/></td>
	        <td><fmt:formatNumber value="${object.accounts_receivable}" pattern="#,### 원"/></td>
	        <td><fmt:formatNumber value="${object.total_sum}" pattern="#,### 원"/></td>
	    </tr>
	</c:forEach>


