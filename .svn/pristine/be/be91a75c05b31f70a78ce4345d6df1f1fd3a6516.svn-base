<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() {
	
		$.ajax({
			url : "/order/orderList.do",
			type : "post",
			dataType : "json",
			success : function(response) {
				var orderList = response.oList; // 서버에서 반환된 주문 목록 배열
				var html = "";

				// 주문 목록 배열을 순회하며 테이블 행 생성
				orderList.forEach(function(order) {
					html += "<tr>";
					html += "<td>" + order.seq + "</td>";
					html += "<td>" + order.product_name + "</td>";
					html += "<td>" + order.order_count + "</td>";
					html += "<td>" + order.order_date + "</td>";
					html += "</tr>";
				});

				// 생성된 HTML을 테이블에 추가
				$("#orderDetail").html(html);
			},
			error : function(xhr, status, error) {
				console.error("AJAX 오류 발생:", error);
			}
		});
	});
</script>

	<div>
		<p class="conTitle">
			<span>주문 목록</span>
		</p>

		<div>
			<table class="col">
				<caption>caption</caption>
				<colgroup>
					<col width="50px">
					<col width="200px">
					<col width="60px">
					<col width="50px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">주문 ID</th>
						<th scope="col">상품 이름</th>
						<th scope="col">상품 수량</th>
						<th scope="col">주문 일자</th>
					</tr>
				</thead>
				<tbody id="orderDetail">
					<!-- 주문 목록이 여기 추가됩니다 -->
				</tbody>
			</table>
		</div>
	</div>

