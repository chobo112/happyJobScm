<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
		<!-- 갯수가 0인 경우  -->
	<c:if test="${orderListCnt eq 0 }">
		<tr>
			<td colspan="4">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>
	
	
	<c:if test="${orderListCnt > 0 }">
		<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
		
	<c:forEach items="${orderList}" var="orderListItem">
	    <tr>
	        <td id="order_seq">${orderListItem.seq}</td>
	        <td id="order_obtain_date">${orderListItem.obtain_date}</td>
	        <td id="order_cust_name">${orderListItem.cust_name}</td>
	        <td id="order_item_name">${orderListItem.item_name}</td>
	        <td id="order_obtain_count">${orderListItem.obtain_count}</td>
	        <td  style="display:none"id="order_item_code">${orderListItem.item_code}</td>
	        <td  style="display:none"id="order_inventory_count">${orderListItem.inventory_count}</td>
	       <!-- 주문수량 - 재고수량을 계산하여 표시 -->
	        <td style="display:none" id="order_count">
	            <c:out value="${orderListItem.obtain_count - orderListItem.inventory_count}"/>
	        </td>
        
	        <td>
	            <button type="button" class="btn btn-secondary btn-sm openOrderbtn" id="openOrderbtn-${status.index}" 
	            		data-order-id="${obtainListItem.seq}" 
	            		onclick="javascript:obtainModal(this)" >발주지시서작성</button>
	        </td>
				  <c:set var="nRow" value="${nRow + 1}" /> 
			</c:forEach>	
		</c:if>		
		
		<input type="hidden" id="totcnt" name="totcnt" value="${orderListCnt}"/>							 
