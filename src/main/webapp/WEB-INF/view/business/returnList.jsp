<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${returnList}" var="returnListItem">
    <c:if test="${not empty returnListItem.refund_bank_num}">
 	   <tr>
	        <td style="display:none" id="endloc">${returnListItem.storage_loc} ${returnListItem.storage_detail_loc}</td>
	        <td style="display:none" id="obtain_date">${returnListItem.obtain_date}</td>
	        <td style="display:none" id="cust_addr">${returnListItem.cust_addr}</td>
	        <td style="display:none" id="cust_detail_addr">${returnListItem.cust_detail_addr}</td>
	        <td style="display:none" id="return_seq">${returnListItem.seq}</td>
	        <td style="display:none" id="return_storage_code">${returnListItem.storage_code}</td>
	        <td style="display:none" id="return_cust_name">${returnListItem.cust_name}</td>
	        <td style="display:none" id="return_item_code">${returnListItem.item_code}</td>
	        <td id="return_item_name">${returnListItem.item_name}</td>
	        <td id="return_return_count">${returnListItem.return_count}</td>
	        <td id="total_price">
	            <c:set var="totalPrice" value="${returnListItem.item_price * returnListItem.return_count}"></c:set>
	            <fmt:formatNumber value="${totalPrice}" type="currency" />
	        </td>
	        <td id="return_return_order_date">
	            <fmt:formatDate value="${returnListItem.return_order_date}" pattern="yyyy-MM-dd" />
	        </td>
	        <td id="return_return_processing_date">
	            <fmt:formatDate value="${returnListItem.return_processing_date}" pattern="yyyy-MM-dd" />
	        </td>
	        <td id="return_signYN">${returnListItem.signYN}</td>
	        <td id="return_refund_bank">${returnListItem.refund_bank}</td>
	        <td id="return_refund_bank_num">${returnListItem.refund_bank_num}</td>
	        <td id="return_refund_bank_name">${returnListItem.refund_bank_name}</td>
	        <td>
	            <c:if test="${returnListItem.signYN eq 'Y'}">
	                <button type="button" class="btn btn-primary btn-sm openDeliverybtn" id="openDeliverybtn-${status.index}" 
	                    data-order-id="${returnListItem.loginID}" 
	                    onClick="javascript:returnInsertModal(this);">반품배송지시서작성</button>
	            </c:if>
	        </td>
	    </tr>
	</c:if>
</c:forEach>
		
		
					 
