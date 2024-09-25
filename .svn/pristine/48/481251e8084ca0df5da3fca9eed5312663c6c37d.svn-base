<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
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
	    </tr>
	</c:forEach>							 
