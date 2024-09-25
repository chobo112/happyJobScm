<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Job Korea</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- <script src="https://unpkg.com/axios@0.12.0/dist/axios.min.js"></script>
<script src="https://unpkg.com/lodash@4.13.1/lodash.min.js"></script> -->
<!-- D3 -->
<style>
//
click-able rows
	.clickable-rows {tbody tr td { cursor:pointer;
	
}

.el-table__expanded-cell {
	cursor: default;
}
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    // AJAX 요청으로 target.jsp 파일 가져오기
   /*  $.ajax({
        url: "/WEB-INF/view/dashboard/Notice.jsp",
        type: "GET",
        dataType: "html",
        success: function(response) {
            // 응답에서 필요한 부분 추출
            var content = $(response).find(".content").html();
            // #mainContent div에 추가
            $("#mainContent").html(content);
        },
        error: function(xhr, status, error) {
            console.error("AJAX 오류 발생:", error);
        }
    }); */
});
</script>

</head>
<body>
	<form id="myForm" action="" method="">

		<input type="hidden" id="currentPage" value="1"> <input
			type="hidden" id="selectedInfNo" value="">
		<!-- 모달 배경 -->
		<div id="mask"></div>

		<div id="wrap_area">

			<h2 class="hidden">컨텐츠 영역</h2>
			<div id="container">
				<ul>
					<li class="lnb">
						<!-- lnb 영역 --> <jsp:include
							page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
					</li>
					
					<li class="contents">
						<!-- contents -->
						<h3 class="hidden">contents 영역</h3> <!-- content -->

						<div class="content" style="margin-bottom: 20px;">

							<p class="Location">
								<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
								<span class="btn_nav bold">메인</span> <a
									href="../dashboard/dashboard.do" class="btn_set refresh">새로고침</a>
							</p>
							 <div id="mainContent">
        						<!-- target.jsp의 #content 부분이 여기 추가됩니다 -->
        					<%@ include file="/WEB-INF/view/dashboard/Notice.jsp" %>
        					<%@ include file="/WEB-INF/view/dashboard/Order.jsp" %>
        					
        					
        					
							
							
    						</div>					
													
						
							
							
						</div>
							
 					</li>
					<li>
						
					</li>
				</ul>
					<%-- <ul>
					
				</ul> --%>
			</div>
		</div>
	</form>
</body>
</html>