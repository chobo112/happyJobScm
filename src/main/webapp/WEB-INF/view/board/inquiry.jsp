<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>1:1문의</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
	var pageSize = 5;
	var pageBlockPage = 10;

	$(function() {
		inquirySearch();
		registerBtnEvent();
		$("#inq").hide();
		$("#answer").hide();
	})

	function openInsert() {
		
		$("#post_title").val("");
		$("#post_text").val("");
		$("#writerID").val("${loginID}");
		$("#category_code").val("");
		$("#btnUpdateInquiry").hide();
		$("#btnSaveInquiry").show();
		$("#inq").show();
	}

	function registerBtnEvent() {
		$("#searchBtn").click(function(e) {
			e.preventDefault();
			inquirySearch();
		});

		$("a[name=btn]").click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr("id");

			switch (btnId) {
			case "btnUpdateInquiry":
				updateInquiry();
				break;
			case "btnDeleteInquiry1":
				deleteInquiry();
				break;
			case "btnDeleteInquiry2":
				deleteInquiry();
				break;
			case "btnClose":
				close();
				break;
			case "answerClose":
				answerClose();
				break;
			case "btnSaveAnswer":
				answerInsert();
				break;	
			case "btnUpdateAnswer":
				answerUpdate();
				break;	
			case "btnDeleteAnswer":
				answerDelete();
				break;	
			}

		})
	}
	
	
	function close() {
		$("#inq").hide();
	}

	function inquirySearch(cpage) {
		cpage = cpage || 1;

		// 공지사항 데이터 보여주는 로직
		var param = {
			searchTitle : $("#searchTitle").val(),
			searchStDate : $("#searchStDate").val(),
			searchEdDate : $("#searchEdDate").val(),
			currentPage : cpage,
			pageSize : pageSize
		};

		var callBackFunction = function(response) {
			$("#inquiryList").empty().append(response);

			var pagieNavigateHtml = getPaginationHtml(cpage,
					$("#totcnt").val(), pageSize, pageBlockPage,
					"inquirySearch")
			$("#pagingNavi").empty().append(pagieNavigateHtml);
			$("#currentPage").val(cpage);
		}

		callAjax("/board/inquiryList.do", "post", "text", false, param,
				callBackFunction);
	}

	function saveInquiry() {
		if (!fValidate()) {
			return;
		}
		var param = {
			title : $("#post_title").val(),
			category_code : $("#category_code").val(),
			content : $("#post_text").val(),
			seq : $("#seq").val()
		};
		var callBackFunction = function(response) {
			if (response.result == "success") {
				alert("저장이 되었습니다");
				inquirySearch();
			}
		};

		callAjax("/board/inquiryInsert.do", "post", "json", false, param,
				callBackFunction);
	}

	function updateInquiry() {
		if (!fValidate()) {
			return;
		}

		var param = {
			title : $("#post_title").val(),
			content : $("#post_text").val(),
			category_code : $("#category_code").val(),
			seq : $("#seq").val()
		}

		var callBackFunction = function(response) {
			if (response.result == "success") {
				alert("수정이 되었습니다");
				gfCloseModal();
				inquirySearch($("#currentPage").val());
			}
		}

		callAjax("/board/inquiryUpdate.do", "post", "json", false, param,
				callBackFunction);
	}

	function inquiryDetail(seq) {
		
		var param = {
			seq : seq
		}

		var callBackFunction = function(data) {
			var detail = data.detailValue;

			$("#writerID").val(detail.loginID);
			$("#post_title").val(detail.post_title);
			$("#post_text").val(detail.post_text);
			$("#category_code").val(detail.category_code);
			$("#seq").val(detail.seq);
			$("#btnUpdateInquiry").show();
			$("#btnSaveInquiry").hide();
			$("#btnDeleteNotice").show();
			answerChk(seq);
			
			var loginID = "${loginID}";
			var writerID = $("#writerID").val()
			if(loginID == writerID){
				$("#btnBundle").show()
			}else if(loginID != writerID){
				$("#btnBundle").hide()
			}
			
			//삭제버튼 중복 방지 기능
			var userType = "${userType}";
		  	if (userType === 'C') {
		    document.getElementById('btnDeleteInquiry2').style.display = 'none';
		  }
			
			$("#inq").show();
			
		}

		callAjax("/board/inquiryDetail.do", "post", "json", false, param,
				callBackFunction);
	}

	function deleteInquiry() {
		var param = {
			seq : $("#seq").val()
		}
		var callBackFunction = function(data) {
			if (data.result == "success") {
				alert("삭제 되었습니다");
				gfCloseModal();
				inquirySearch();
			}
		}

		callAjax("/board/inquiryDelete.do", "post", "json", false, param,
				callBackFunction);
	}

	function fValidate() {
		var chk = checkNotEmpty([ [ "post_title", "제목를 입력해 주세요." ],
				[ "post_text", "내용을 입력해 주세요" ],
				[ "category_code", "카테고리를 정해 주세요" ] ]);
		if (!chk) {
			return;
		}

		return true;
	}

	/* --------------------답변 관련---------------------- */

	function answerChk() {

		var param = {
			seq : $("#seq").val()
		}

		var callBackFunction = function(response) {
			if (response.chkResult > 0) {
				answerDetail(param.seq)
				$("#answer").show();
				$("#btnSaveAnswer").hide();
				$("#openAnswer").hide();
				$("#btnUpdateAnswer").show();
				
				
			} else if(response.chkResult == 0){
				$("#answer").hide();
				$("#btnSaveAnswer").show();
				$("#btnUpdateAnswer").hide();
				$("#openAnswer").show();
			}
		}

		callAjax("/board/answerChk.do", "post", "json", false, param,
				callBackFunction);
	}

	
	function answerDetail(seq) {
		
		var param = {
			seq : seq
		}
		
		var callBackFunction = function(data) {
			var detail = data.answerDetail;

			$("#answer_title").val(detail.answer_title);
			$("#answer_text").val(detail.answer_text);
			//$("#seq").val(detail.seq); 얘때메 answerUpdate가 제대로 작동안하고있었다

		}

		callAjax("/board/answerDetail.do", "post", "json", false, param,
				callBackFunction);
	}
	
	function openAnswer(){
		$("#answer_title").val("");
		$("#answer_text").val("");		
		$("#answer").show();
	}
	
	function answerClose(){
		
		$("#answer").hide();
	}
	
	function answerInsert() {
		if (!answerfValidate()) {
			return;
		}
		var param = {
			answer_title : $("#answer_title").val(),
			answer_content : $("#answer_text").val(),
			seq : $("#seq").val()
		};
		var callBackFunction = function(response) {
			if (response.result == "success") {
				alert("저장이 되었습니다");
				//inquirySearch();
			}
		};

		callAjax("/board/answerInsert.do", "post", "json", false, param,
				callBackFunction);
	}
	
	function answerUpdate() {
		if (!answerfValidate()) {
			return;
		}

		var param = {
			answer_title : $("#answer_title").val(),
			answer_content : $("#answer_text").val(),
			seq : $("#seq").val()
		}

		var callBackFunction = function(response) {
			if (response.result == "success") {
				alert("수정이 되었습니다");
			}
		}

		callAjax("/board/answerUpdate.do", "post", "json", false, param,
				callBackFunction);
	}
	
	function answerDelete() {
		var param = {
			seq : $("#seq").val()
		}
		var callBackFunction = function(data) {
			if (data.result == "success") {
				alert("삭제 되었습니다");
				gfCloseModal();
				inquirySearch();
			}
		}

		callAjax("/board/answerDelete.do", "post", "json", false, param,
				callBackFunction);
	}
	
	
	function answerfValidate() {
		var chk = checkNotEmpty([ 
		        [ "answer_title", "제목를 입력해 주세요." ],
				[ "answer_text", "내용을 입력해 주세요" ] 
				]);
		if (!chk) {
			return;
		}

		return true;
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
								class="btn_nav bold">시스템 관리</a> <span class="btn_nav bold">공지
								사항</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>1:1 문의 </span> <span class="fr"> 제목 <input
								type="text" id="searchTitle" name="searchTitle"
								style="height: 25px; margin-right: 10px;" /> 기간 <input
								type="date" id="searchStDate" name="searchStDate"
								style="height: 25px; margin-right: 10px;" /> ~ <input
								type="date" id="searchEdDate" name="searchEdDate"
								style="height: 25px; margin-right: 10px;" /> <a
								class="btnType red" href="" name="searchbtn" id="searchBtn"><span>검색</span></a>
								<a class="btnType blue" href="javascript:openInsert()"
								name="modal"><span>신규</span></a>
							</span>
						</p>


						<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="50px">
									<col width="160px">
									<col width="40px">
									<col width="60px">
									<col width="50px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">문의 번호</th>
										<th scope="col">문의 제목</th>
										<th scope="col">카테고리</th>
										<th scope="col">문의 날짜</th>
										<th scope="col">작성자</th>

									</tr>
								</thead>
								<tbody id="inquiryList"></tbody>
							</table>

							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingNavi"></div>

						</div>
						<br>
						<!-- 1:1문의 작성 -->
						<input type="hidden" id="seq" name="seq" value="">
						<div id="inq">
							<p class="conTitle">
								<span>1:1 문의하기 </span> <span class="fr">
									<div class="div_std_list">
										<table class="col">
											<caption>caption</caption>
											<colgroup>
												<col width="10%">
												<col width="30%">
											</colgroup>

											<thead>
												<tr>
													<th scope="col">작성자</th>
													<td><input type="text" class="inputTxt p100"
														name="writerID" id="writerID" value=""
														readonly="readonly" /></td>
													<td><select id="category_code" name="category_code">
															<option value="">질문 카테고리</option>
															<c:forEach items="${categoryList}" var="list">
																<option value="${list.category_code}">${list.category_name}</option>
															</c:forEach>
													</select></td>
												</tr>
												<tr>
													<th scope="col">제목</th>
													<td colspan="3"><input type="text"
														class="inputTxt p100" name="post_title" id="post_title" /></td>
												</tr>
												<tr>
													<th scope="col">내용</th>
													<td colspan="3"><textarea class="inputTxt p100"
															name="post_text" id="post_text"></textarea></td>
												</tr>
											</thead>
										</table>
									</div> 
									<a class="btnType blue" id="btnSaveInquiry"
									href="javascript:saveInquiry();"><span>저장</span></a> 
									<div id="btnBundle" style="display:none">
									<a href=""
									class="btnType blue" id="btnUpdateInquiry" name="btn"
									style="display: none"><span>수정</span></a> 
									<a href="" class="btnType blue" id="btnDeleteInquiry1" name="btn"><span>삭제</span></a>
									<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
									</div>
									<c:if test="${userType eq 'C' }">
									<a onclick="javascript:openAnswer();" class="btnType blue" id="openAnswer" name="btn" style="cursor:pointer"><span>답변달기</span></a>
									<a href="" class="btnType blue" id="btnDeleteInquiry2" name="btn"><span>삭제</span></a>
									</c:if>
									<!-- 답변부분 -->
									<div class="answer" id="answer">
										<table class="col">
											<caption>caption</caption>
											<colgroup>
												<col width="10%">
												<col width="30%">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">답변 제목</th>
													<td colspan="3"><input type="text"
														class="inputTxt p100" name="answer_title"
														id="answer_title" /></td>
												</tr>
												<tr>
													<th scope="col">답변 내용</th>
													<td colspan="3"><textarea class="inputTxt p100"
															name="answer_text" id="answer_text">
								</textarea></td>
												</tr>
											</thead>

											<tbody id="listStd"></tbody>
										</table>
										<c:if test="${userType eq 'C' }">
											<div id="answerBtn">
									<a href="" class="btnType blue" id="btnSaveAnswer" name="btn"><span>답변등록</span></a> 
									<a href="" class="btnType blue" id="btnUpdateAnswer" name="btn" style="display: none"><span>수정</span></a> 
									<a href="" class="btnType blue" id="btnDeleteAnswer" name="btn"><span>삭제</span></a> 
									<a href="" class="btnType gray" id="answerClose" name="btn"><span>닫기</span></a>
											</div>
										</c:if>
									</div> <!-- 답변 끝 -->
								</span>
							</p>
						</div>
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3> <jsp:include
						page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

</body>
</html>
