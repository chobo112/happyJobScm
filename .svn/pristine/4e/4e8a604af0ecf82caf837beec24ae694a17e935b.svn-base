<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#show").hide();
    $.ajax({
        url: "/order/orderList.do",
        type: "post",
        dataType: "json",
        success: function(response) {
            var orderList = response.oList;
            var html = "";
            
            orderList.forEach(function(item){
                html += "<option value='" + item.seq + "'>" + item.product_name + "</option>";
            });
            
            $("#list1").html(html);
        },
        error: function(xhr, status, error) {
            console.error("AJAX 오류 발생:", error);
        }
       
    });
    //먼저 는 그냥 표에 출력 상품 이름 클릭시 디테일인데 수정이 가능한 페이지 거기서 삭제도 
    //신규는 따로 버튼 만들어서 할것 
    $("#list1").change(function(){
    	var seq = $(this).val();
    	$("#show").show();
    	$.ajax({
    		url:"/order/orderDetail.do",
    		type:"post",
    		dataType:"json",
    		data: {seq : seq},
    		success : function(response){
    			var orderDetail = response.orderDetail;
    			var html ="";
    			
    			orderDetail.forEach(function(item){
    				html += "<td id='seq'>"+item.seq+"</td>";
					html += "<td id='product_name'>"+item.product_name+"</td>";	
    				html += "<td id='order_count'>"+item.order_count+"</td>";
    				html += "<td id='order_date'>"+item.order_date+"</td>";

    			})
    			$("#orderDetail").append(html)
    		}
    		
    	})
    })
    
});
</script>
</head>
<body>
<div>
    <div>
        <h1>주문 목록</h1>
    </div>
    <div>
        <select id="list1">
            <!-- Options dynamically populated by JavaScript -->
        </select>
    </div>
    <div>
    	<table id="show" class="col">
    		<tr>
    			<td>주문 ID</td>
    			<td>상품 이름</td>
    			<td>상품 수량</td>
    			<td>주문 일자</td>
    		</tr>
    		<tr id="orderDetail">
    			
    		</tr>
    	</table>
    </div>
</div>
</body>
</html>
