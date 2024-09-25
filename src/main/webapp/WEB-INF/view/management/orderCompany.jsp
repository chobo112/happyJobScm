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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		orderCompanyList()
		registerBtnEvent()
	})

	function registerBtnEvent() {

		$("#newCompany").click(function(e) {
			e.preventDefault();
			gfModalPop("#newCompanyModal")
		});

		$("#btnNewCompany").click(function(e) {
			if($("#newCompanyInput").val() != ""){				
				newCompanySave();
				orderCompanyList();
			}else{
				alert("빈칸멈춰!")
			}
		});
		$("#btnNewItem").click(function(e) {
			if($("#selectOption").val() != null){
				newItemSave();
				orderCompanyList();				
			}else{
				alert("고르셈")
			}
		});
	}

	function orderCompanyList() {

		var param = {

		}

		var callBackFunction = function(res) {

			$("#orderCompanyList").empty().append(res);

		}

		callAjax("/management/orderCompanyList.do", "post", "text", false,
				param, callBackFunction);
	}

	function newCompanySave() {
		var param = {
			company_name : $("#newCompanyInput").val()
		};

		var callBackFunction = function(res) {

		}

		callAjax("/management/newCompanySave.do", "post", "text", false, param,
				callBackFunction);
	}

	function orderComponyDetail(seq) {

		$("#hiddenInput").val(seq)

		var param = {
			company_seq : seq
		};

		var callBackFunction = function(res) {

			$("#orderComponyDetail").empty().append(res);
			orderComSelectItem()
			gfModalPop("#orderComponyModal")
		}

		callAjax("/management/orderComponyDetail.do", "post", "text", false,
				param, callBackFunction);
	}

	function orderComSelectItem(seq) {
		var param = {
			company_seq : seq
		};

		var callBackFunction = function(res) {

			$("#selectOption").empty().append(res);
		}

		callAjax("/management/orderComSelectItem.do", "post", "text", false,
				param, callBackFunction);
	}

	function orderComAddItem() {

		var param = {
			company_seq : seq
		};

		var callBackFunction = function(res) {

			console.log(res);
			$("#selectOption").empty().append(res);
		}

		callAjax("/management/orderComSelectItem.do", "post", "text", false,
				param, callBackFunction);

	}

	function newItemSave() {

		console.log($("#selectOption").val())
		var param = {
			company_seq : $("#hiddenInput").val(),
			item_code : $("#selectOption").val()
		};

		var callBackFunction = function(res) {

		}

		callAjax("/management/newItemSave.do", "post", "text", false, param,
				callBackFunction);
	}
</script>

<style type="text/css">
</style>

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
								class="btn_nav bold">관리</a> <span class="btn_nav bold">발주업체관리</span>
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>


						<div>
							<p class="conTitle">
								<span>발주업체관리</span> <span class="fr"> <a
									class="btnType red" href="" name="newCompany" id="newCompany"><span>업체
											등록</span></a>
								</span>
							</p>

							<div>
								<div class="divStorageList">
									<table class="col">
										<caption>발주업체관리</caption>
										<colgroup>
											<col width="20px">
											<col width="100px">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">업체번호</th>
												<th scope="col">업체이름</th>
											</tr>
										</thead>
										<tbody id="orderCompanyList"></tbody>
									</table>
									<div class="paging_area" id="pagingNavi"></div>
								</div>

							</div>



							<h3 class="hidden">풋터 영역</h3>
							<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div id="newCompanyModal" class="layerPop layerType2"
		style="width: 300px;">
		<dl>
			<dt>
				<strong>발주 업체 등록</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<div>
					<label>업체이름</label> <input type="text" id="newCompanyInput">
				</div>
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnNewCompany" name="btn"><span>저장</span></a>
					<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

	<div id="orderComponyModal" class="layerPop layerType2"
		style="width: 300px;">
		<dl>
			<dt>
				<strong>상세보기</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<div>
					<table class="col">
						<caption>발주업체관리</caption>
						<colgroup>
							<col>
							<col>
						</colgroup>
						<thead>
							<tr>
								<th scope="col">업체이름</th>
								<th scope="col">물품이름</th>
							</tr>
						</thead>
						<tbody id="orderComponyDetail"></tbody>
					</table>
					<div style="margin-top: 15px;">
						<label>물품추가</label> 
						<select id="selectOption"></select>
					</div>
				</div>
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnNewItem" name="btn"><span>추가</span></a>
					<input type="hidden" value="" id="hiddenInput">
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>



</body>
</html>