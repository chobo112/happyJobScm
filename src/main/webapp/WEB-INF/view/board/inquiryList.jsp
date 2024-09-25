<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


				
		<!-- 갯수가 0인 경우  -->
		<c:if test="${inquiryCnt eq 0 }">
			<tr>
				<td colspan="4">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		

		<!-- 갯수가 있는 경우  -->
		<c:if test="${inquiryCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
			<c:forEach items="${inquiryList}" var="list">
				<tr>
					    <td id="tdSeq">${list.seq}</a></td>
						<%-- <td><a href="javascript:noticeDetailModal(${list.noti_seq});">${list.noti_title}</a></td> --%>
						<td><a href="javascript:inquiryDetail(${list.seq});">${list.post_title}<span id="answerStatus_${list.seq}"></span></a></td>
						
						<td>${list.category_name}</td>
						<td>${list.post_date}</td>
						<td>${list.loginID}</td>
					<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				 <c:set var="nRow" value="${nRow + 1}" /> 
			</c:forEach>
		</c:if>
		
		<!-- 이거 중간에 있으면 table 안먹힘  -->

        <input type="hidden" id="totcnt" name="totcnt" value="${noticeCnt}"/>











