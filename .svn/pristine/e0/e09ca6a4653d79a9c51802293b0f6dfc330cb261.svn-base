<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
						
	<!-- 갯수가 0인 경우  -->
	<c:if test="${obtainListCnt eq 0 }">
		<tr>
			<td colspan="4">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>
	
	
	<c:if test="${obtainListCnt > 0 }">
		<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
		
			<c:forEach items="${obtainList}" var="obtainListItem">
				    <tr>
				        <td style="display:none" id="obtain_item_code">${obtainListItem.item_code}</td>
				        <td id="obtain_seq">${obtainListItem.seq}</td>
				        <td id="obtain_obtain_date">${obtainListItem.obtain_date}</td>
				        <td id="obtain_cust_name">${obtainListItem.cust_name}</td>
				        <td id="obtain_item_name">${obtainListItem.item_name}</td>
				        <td id="obtain_obtain_count">${obtainListItem.obtain_count}</td>
				        <td id="obtain_inventory_count">${obtainListItem.inventory_count}</td>
				        <td id="obtain_depositYN">${obtainListItem.depositYN}</td>
				        <td style="display:none"id="obtain_addr">${obtainListItem.addr}</td>
			
				        <td>
				            <c:if test="${obtainListItem.depositYN eq 'Y'}">
				                <c:if test="${obtainListItem.obtain_count <= obtainListItem.inventory_count}">
				                    <button type="button" class="btn btn-primary btn-sm openDeliverybtn" 
				                            id="openDeliverybtn-${status.index}" 
				                            data-order-id="<c:out value='${obtainListItem.loginID}'/>" 
				                            onClick="javascript:deliveryModal(this);">배송지시서작성</button>
				                </c:if>
				            </c:if>
				        </td>
				    </tr>
				  <c:set var="nRow" value="${nRow + 1}" /> 
			</c:forEach>	
		</c:if>		
		
		<input type="hidden" id="totcnt" name="totcnt" value="${obtainListCnt}"/>
						 
