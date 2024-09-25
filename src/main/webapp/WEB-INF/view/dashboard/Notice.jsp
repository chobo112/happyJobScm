<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

var pageSize = 5;
var pageBlockPage = 10;

$(function(){
	noticeSearch();
	registerBtnEvent();
	filePreview();
})

function registerBtnEvent(){
	$("#searchBtn").click(function(e){
		e.preventDefault();
		noticeSearch();
	});
	
	$("a[name=btn]").click(function(e){
		e.preventDefault();
		
		var btnId = $(this).attr("id");
		
		switch(btnId){
			case "btnSaveNotice":
				saveNotice();
				break;
			case "btnUpdateNotice":
				updateNotice();
				break;
			case "btnDeleteNotice":
				deleteNotice();
				break;
			case "btnClose":
				gfCloseModal();
				break;
			case "btnSavefile":
				saveFileNotice();
				break;
			case "btnUpdatefile":
				updateFileNotice();
				break;
			case "btnDeletefile":
				deleteFileNotice();
				break;
		}
		
		
	})
}

function noticeSearch(cpage){
	cpage = cpage || 1;
	
	// 공지사항 데이터 보여주는 로직
	var param = {
			searchTitle : $("#searchTitle").val(),
			searchStDate : $("#searchStDate").val(),
			searchEdDate : $("#searchEdDate").val(),
			currentPage : cpage,
			pageSize : pageSize
	};
	
	var callBackFunction = function(response){
		$("#noticeList").empty().append(response);
		
		var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "noticeSearch")
		$("#pagingNavi").empty().append(pagieNavigateHtml);
		$("#currentPage").val(cpage);
	}
	
	callAjax("/board/noticeList.do", "post", "text", false, param, callBackFunction);
}

function insertModal(){
	// 모달 열어주는 함수
	$("#loginId").val("");
	$("#noticeTitle").val("");
	$("#noticeContent").val("");
	$("#noticeSeq").val("");
	$("#btnUpdateNotice").hide();
	$("#btnSaveNotice").show();
	$("#btnDeleteNotice").hide();
	
	gfModalPop("#noticeInsertModal");
}

function saveNotice(){
	if(!fValidate()){
		return;
	}
	var param = {
			title : $("#noticeTitle").val(),
			content : $("#noticeContent").val(),
			noticeSeq: $("#noticeSeq").val()
	}
	
	var callBackFunction = function(response){
		if(response.result == "success"){
			alert("저장이 되었습니다");
			gfCloseModal();
			noticeSearch();
		}
	}
	
	callAjax("/board/noticeSave.do", "post", "json", false, param, callBackFunction);
}

function updateNotice(){
	if(!fValidate()){
		return;
	}
	
	var param = {
			title : $("#noticeTitle").val(),
			content : $("#noticeContent").val(),
			noticeSeq: $("#noticeSeq").val()
	}
	
	var callBackFunction = function(response){
		if(response.result == "success"){
			alert("수정이 되었습니다");
			gfCloseModal();
			noticeSearch($("#currentPage").val());
		}
	}
	
	callAjax("/board/noticeUpdate.do", "post", "json", false, param, callBackFunction);
}

function noticeDetailModal(seq){
	var param = {
			noticeSeq: seq
	}
	
	var callBackFunction = function(data){
		var detail = data.detailValue;
		
		$("#loginId").val(detail.loginID);
		$("#noticeTitle").val(detail.noti_title);
		$("#noticeContent").val(detail.noti_content);
		$("#noticeSeq").val(detail.noti_seq);
		$("#noticeContent").val(detail.noti_content);
		$("#noticeSeq").val(detail.noti_seq);
		$("#btnUpdateNotice").show();
		$("#btnSaveNotice").hide();
		$("#btnDeleteNotice").show();
		
		gfModalPop("#noticeInsertModal");
	}
	
	callAjax("/board/noticeDetail.do", "post", "json", false, param, callBackFunction);
}



function deleteNotice(){
	var param = {
			noticeSeq: $("#noticeSeq").val()
	}
	
	var callBackFunction = function(data){
		if(data.result == "success"){
			alert("삭제 되었습니다");
			gfCloseModal();
			noticeSearch();
		}
	}
	
	callAjax("/board/noticeDelete.do", "post", "json", false, param, callBackFunction);
}

function fValidate() {
	var chk = checkNotEmpty(
			[
					[ "noticeTitle", "제목를 입력해 주세요." ]
				,	[ "noticeContent", "내용을 입력해 주세요" ]
			]
	);
	if (!chk) {
		return;
	}

	return true;
}


// ------------------------------파일 기능 -----------------------------------------------------//
function insertFileModal(){
	$("#loginId").val("");
	$("#fileTitle").val("");
	$("#fileContent").val("");
	$("#noticeSeq").val("");
	$("#btnUpdatefile").hide();
	$("#btnSavefile").show();
	$("#btnDeletefile").hide();
	$("#preview").empty();
	$("#fileInput").val("")
	
	gfModalPop("#filePopUp");
}

function filePreview(){
	$("#fileInput").change(function(e){
		e.preventDefault();
		
		// 파일이 있는 경우
		if($(this)[0].files[0]){
			var fileInfo = $("#fileInput").val();
			var fileInfoSplit = fileInfo.split(".");
			var fileLowerCase = fileInfoSplit[1].toLowerCase();
			
			var imgPath = "";
			var previewHtml = "";
			
			if(fileLowerCase == "jpg" || fileLowerCase == "gif" || fileLowerCase == "png"){
				// 파일이 이미지 일 경우
				imgPath = window.URL.createObjectURL($(this)[0].files[0]);
				
				previewHtml = "<img src='" + imgPath + "' id='imgFile' style='width: 100px; height: 100px;' />";	
			} else {
				// 파일이 이미지가 아닌 다른 것일 경우
				previewHtml = "";
			}
			$("#preview").empty().append(previewHtml)
		}
	});
}

function fValidatefile() {
	var chk = checkNotEmpty(
			[
					[ "fileTitle", "제목를 입력해 주세요." ]
				,	[ "fileContent", "내용을 입력해 주세요" ]
			]
	);
	if (!chk) {
		return;
	}
	return true;
}

// 파일 저장
function saveFileNotice(){
	if(!fValidatefile()){
		return;
	}
	
	var getForm = document.getElementById("noticeForm");
	getForm.entype = 'multipart/form-data';
	var fileData = new FormData(getForm);
	
	var callBackFunction = function(data){
		if(data.result == "success"){
			alert("저장이 되었습니다");
			gfCloseModal();
			noticeSearch();
		}
	}
	
	callAjaxFileUploadSetFormData("/board/noticeSaveFile.do", "post", "json", false, fileData, callBackFunction);
}

function noticeDetailFileModal(noticeSeq){
	var param = {
			noticeSeq : noticeSeq
	}
	
	var callBackFunction = function(data){
		$("#noticeSeq").val(data.detailValue.noti_seq);
		detailModalSetting(data.detailValue);
		gfModalPop("#filePopUp");
	}
	
	callAjax("/board/noticeDetail.do", "post", "json", false, param, callBackFunction);
}

function detailModalSetting(detail){
	// 상세조회 => 파일이 있을 경우(이미지) => 미리보기
	if(detail != null){
		$("#fileTitle").val(detail.noti_title);
		$("#fileContent").val(detail.noti_content);
		$("#btnSavefile").hide();
		$("#btnUpdatefile").show();
		$("#btnDeletefile").show();
		
		if(detail.file_name != null){
			var ext = detail.file_ext.toLowerCase();
			var imagePath = "";
			var previewHtml = "";
			
			if(ext == "jpg" || ext == "gif" || ext == "png"){
				imagePath = detail.logical_path;
				
				previewHtml = "<a href='javascript:download()'>";
				previewHtml += "<img src='" + imagePath + "' id='imgFile' style='width: 100px; height: 100px;' />";	
				previewHtml += "</a>";
			} else {
				previewHtml = "<a href='javascript:download()'>";
				previewHtml += detail.file_name;
				previewHtml += "</a>";
			}
			
			$("#preview").empty().append(previewHtml);
			$("#fileInput").val("");
		}
	}
}

function updateFileNotice(){
	if(!fValidatefile()){
		return;
	}
	
	var getForm = document.getElementById("noticeForm");
	getForm.entype = 'multipart/form-data';
	var fileData = new FormData(getForm);
	
	var callBackFunction = function(data){
		if(data.result == "success"){
			alert("저장이 되었습니다");
			gfCloseModal();
			noticeSearch($("#currentPage").val());
		}
	};
	
	callAjaxFileUploadSetFormData("/board/noticeUpdateFile.do", "post", "json", false, fileData, callBackFunction);
}

function deleteFileNotice(){
	var param = {
			noticeSeq: $("#noticeSeq").val()
	}
	
	var callBackFunction = function(data){
		if(data.result == "success"){
			alert("삭제 되었습니다");
			gfCloseModal();
			noticeSearch();
		}
	}
	
	callAjax("/board/noticeDelete.do", "post", "json", false, param, callBackFunction);
}

// 파일 다운로드
function download(){
	var noticeSeq = $("#noticeSeq").val();
	
	var params = "<input type='hidden' name='noticeSeq' value='"+ noticeSeq +"' />";

	$("<form action='noticeDownload.do' method='post' id='fileDownload'>" + params + "</form>"
	).appendTo('body').submit().remove();
}
</script> 

	
<p class="conTitle">
	<span>공지사항</span> 
	<span class="fr">					
                      	 제목
                     <input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
                     	기간
                     <input type="date" id="searchStDate" name="searchStDate" style="height: 25px; margin-right: 10px;"/> 
                     ~ 
                     <input type="date" id="searchEdDate" name="searchEdDate" style="height: 25px; margin-right: 10px;"/>
	  <a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
	  <a class="btnType blue" href="javascript:insertModal();" name="modal"><span>신규</span></a>
	  <a class="btnType blue" href="javascript:insertFileModal();" name="modal"><span>신규(파일)</span></a>
	</span>
</p> 
	
	
	<div class="divNoticeList">
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
		              <th scope="col">공지 번호</th>
		              <th scope="col">공지 제목</th>
		              <th scope="col">공지 날짜</th>
		              <th scope="col">작성자</th>
		              
				</tr>
			</thead>
			<tbody id="noticeList">
					<!-- 갯수가 0인 경우  -->			
			</tbody>
		</table>
		  <input type="hidden" id="totcnt" name="totcnt" value="${noticeCnt}"/>
		<!-- 페이징 처리  -->
		
		<div class="paging_area" id="pagingNavi">
		</div>
		
	</div>

		
		

	<!-- 모달팝업 -->
	<div id="noticeInsertModal" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>공지사항</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>

					<tbody>
						<tr>
							<th scope="row">작성자 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="loginId" id="loginId" readonly="readonly"/></td>
							<!-- <th scope="row">작성일<span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="write_date" id="write_date" /></td> -->
						</tr>
						<tr>
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name="noticeTitle" id="noticeTitle" /></td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="3">
								<textarea class="inputTxt p100" name="noticeContent" id="noticeContent">
								</textarea>
							</td>
						</tr>
						
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveNotice" name="btn"><span>저장</span></a> 
					<a href="" class="btnType blue" id="btnUpdateNotice" name="btn" style="display:none"><span>수정</span></a> 
					<a href="" class="btnType blue" id="btnDeleteNotice" name="btn"><span>삭제</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>

		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>


	<!-- 모달 파일 팝업 --------------------------->
	<form id="noticeForm" action="" method="">
		<input type="hidden" id="noticeSeq" name="noticeSeq" value="">
		<div id="filePopUp" class="layerPop layerType2" style="width: 600px;">
			<dl>
				<dt>
					<strong>공지사항 관리(파일)</strong>
				</dt>
				<dd class="content">
					<!-- s : 여기에 내용입력 -->
					<table class="row">
						<caption>caption</caption>
						<colgroup>
							<col width="120px">
							<col width="*">
							<col width="120px">
							<col width="*">
						</colgroup>

						<tbody>
							<tr>
								<th scope="row">제목 <span class="font_red">*</span></th>
								<td colspan=3><input type="text" class="inputTxt p100"
									name="fileTitle" id="fileTitle" /></td>
							</tr>
							<tr>
								<th scope="row">내용 <span class="font_red">*</span></th>
								<td colspan="3"><textarea name="fileContent"
										id="fileContent" cols="40" rows="5"> </textarea></td>
							</tr>
							<tr>
								<th scope="row">파일</th>
								<td colspan="3"><input type="file" class="inputTxt p100"
									name="fileInput" id="fileInput" /></td>
							</tr>
							<tr>
								<th scope="row">미리보기</th>
								<td>
									<div id="preview"></div>
								</td>
							</tr>
						</tbody>
					</table>

					<!-- e : 여기에 내용입력 -->

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSavefile" name="btn"><span>저장</span></a>
						<a href="" class="btnType blue" id="btnUpdatefile" name="btn"><span>수정</span></a>
						<a href="" class="btnType blue" id="btnDeletefile" name="btn"><span>삭제</span></a>
						<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>
		
		
	</form>

