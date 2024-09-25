<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- 갯수가 0인 경우  -->
		<c:if test="${productCnt eq 0 }">
			<tr>
				<td colspan="4">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>



        <c:if test="${productCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
            <c:forEach var="list" items="${productList}">
                <tr>
                    <td class="itemCode" data-productcode="${list.item_code}" data-imagpath="${list.img_path}" ><a style="cursor:pointer;">${list.item_code}</a></td>
                    <td class="itemName" data-productname="${list.item_name}" data-itemdetail="${list.product_detail}" >${list.item_name}</td>
                    <td class="manufac" data-productmanufac="${list.manufac}" >${list.manufac}</td>
                    <td class="itemValue" data-productvalue="${list.provide_value}" >${list.provide_value}</td>
                </tr>
               <c:set var="nRow" value="${nRow + 1}" />
            </c:forEach>
        </c:if>
        
        
            
            <input type="hidden" id="totcnt" name="totcnt" value="${productCnt}"/>
      
<script>
$(document).ready(function() {
	
	$('.itemCode').click(function() {
		 	//var productCode = $(this).data('productcode');
		 	var row = $(this).closest("tr");
			
			var productCode = row.find(".itemCode").data('productcode');
		    var productName = row.find(".itemName").data("productname");
		    var productManufac = row.find(".manufac").data("productmanufac");
		    var productValue = row.find(".itemValue").data("productvalue");
		    var productDetail = row.find(".itemName").data('itemdetail');
		    var productPath = row.find(".itemCode").data("imagpath");
		     
		    $("#modalProductCode").val(productCode);
		    $("#modalProductName").val(productName);
			$("#modalManufac").val(productManufac);
			$("#modalValue").val(productValue);
			$("#modaldetail").val(productDetail);
			$("#productImg").val(productPath);
			
			$("#modalProductCodeOrigin").val(productCode);
			$("#modalProductNameOrigin").val(productName);
			$("#modalManufacOrigin").val(productManufac);
			$("#modalproductValueOrigin").val(productValue);
			$("#modalproductDetailOrigin").val(productDetail);
			
			
			document.getElementById('productImg').src = productPath;
			
			$(".btn1").show();
			$("#imageTag").show();
			$('#myModal').show();
			
		 
	});
    
});


function getDetailProductList(productCode){
	
}
</script>
    
    

    