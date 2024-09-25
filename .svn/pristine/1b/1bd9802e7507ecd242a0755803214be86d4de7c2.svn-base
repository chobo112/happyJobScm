<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
	$(function() {
		chart()
		registerBtnEvent()
		dateCheck()
	})
	function registerBtnEvent(){
		$("#searchBtn").click(function(e){
			e.preventDefault();
			chart();
		});	
	}

	function chart() {
		var param = {
				searchStDate : $("#searchStDate").val(),
				searchEdDate : $("#searchEdDate").val()
		};

		var callBackFunction = function(res) {
			console.log(res);

			// Google Charts 로드
			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});
			google.charts.setOnLoadCallback(drawChart);

			function drawChart() {
				var title = [ 'Month', '수주액', '발주액' ];
				var data = [];

				// 데이터 포맷팅
				data.push(title); // 제목 추가

				// 서버에서 받아온 데이터 포맷팅
				for (var i = 0; i < res.length; i++) {
					var rowData = [ res[i].month, // 월
					res[i].total_obtain || 0, // 수주액 (없을 경우 기본값 0)
					res[i].total_order || 0 // 발주액 (없을 경우 기본값 0)
					];
					data.push(rowData);
				}

				var dataTable = google.visualization.arrayToDataTable(data);

				var options = {
					title : '수주 & 발주 금액',
					curveType : 'function', // 선 그래프로 설정
					legend : {
						position : 'bottom'
					}, // 범례 위치 설정
					hAxis : {
						title : '날짜' // x 축 제목
					},
					vAxis : {
						title : '금액' // y 축 제목
					}
				};

				// 그래프를 그릴 요소 선택
				var chart = new google.visualization.LineChart(document
						.getElementById('curve_chart'));

				// 그래프 그리기
				chart.draw(dataTable, options);
			}
		};

		// Ajax 호출
		callAjax("/executives/chart.do", "post", "json", false, param,
				callBackFunction);
	}
	
	function dateCheck(){
		$('input[type=date][name="searchEdDate"]').change(function(){
			if($("#searchStDate").val() > $("#searchEdDate").val()){
				alert("날짜 설정을 확인하세요");
				$("#searchEdDate").val(null);
			}
		}) 
		$('input[type=date][name="searchStDate"]').change(function(){
			if($("#searchEdDate").val()){
				if($("#searchStDate").val() > $("#searchEdDate").val()){
					alert("날짜 설정을 확인하세요");
					$("#searchEdDate").val(null);
				}			
			}
		}) 
	} 
	
</script>
</head>
<body>

	<input type="hidden" id="currentPage" value="">
	<!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
	<input type="hidden" name="action" id="action" value="">
	<div id="wrap_area">
		<h2 class="hidden">header 영역</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

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
					<div class="content">
						<p class="Location">
							<a href="#" class="btn_set home">메인으로</a> <a href="#"
								class="btn_nav bold">현황</a> <span class="btn_nav bold">손익</span>
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>


						<div>
							<div class="orderApprovalList">
								<p class="conTitle">
									<span>손익</span> 
									<span class="fr">
										날짜별 검색
										<input	type="date" id="searchStDate" name="searchStDate" style="height: 25px; margin-right: 10px;" />
										~ 
										<input type="date" id="searchEdDate" name="searchEdDate" style="height: 25px; margin-right: 10px;" />
										<a class="btnType red" href="" name="searchbtn" id="searchBtn"><span>검색</span></a>
									</span>
								</p>

							</div>

							<div id="curve_chart" style="width: 1030px; height: 700px"></div>

							<h3 class="hidden">풋터 영역</h3>
							<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div id="approvalModal" class="layerPop layerType2"
		style="width: 122px;"></div>


</body>
</html>