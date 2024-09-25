// unblock when ajax activity stops 
$(document).ajaxStop($.unblockUI);

/**
 * ajax 공통 호출 함수
 *
 * @param
 *   url : 서비스 호출URL
 *   method : post, get
 *   async : true, false
 *   param : data parameter
 *   callback : callback function name
 */
function callAjaxJson(url, method, async, param, callback) {
	//console.log('>>>>>>param일떄',param);
	
	//method는 post 이다. async는 true/false이다.
	if (method == null || method == "") method = "post";
	
	$.ajax({
		type : method,
		url : url,
		contentType: "application/json",
		async : async,
		data : JSON.stringify(param),
		beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", "true");
			$.blockUI({ message: '<h1><img src="/images/admin/comm/busy.gif" /> Just a moment...</h1>', T:99999 });
		},
		success : function(data) {
			callback(data);
		},
		error : function(xhr, status, err) {
			console.log("xhr : " + xhr);
			console.log("status : " + status);
			console.log("err : " + err);
      			
			if (xhr.status == 901) {
				alert("로그인 정보가 없습니다.\n다시 로그인 해 주시기 바랍니다.");
				location.replace('/login.do');
			} else {
				alert('A system error has occurred.' + err);
			}
		},
		complete: function(data) {
			$.unblockUI();
		}
	});
}