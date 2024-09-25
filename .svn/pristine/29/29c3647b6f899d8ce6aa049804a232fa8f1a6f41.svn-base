function dateSetting() {
	var today = new Date().toISOString().substring(0, 10)
	
	$("#startDate").val(today)
	$("#endDate").val(today)
}

function dateFormat(type) {
	var changeDate = $("#startDate")
	var day = new Date($("#endDate").val())
	
	switch(type) {
		case "today" :
			dateSetting()
			break;
		case "week" :
			var sevenDaysAgo = new Date(day);
            sevenDaysAgo.setDate(day.getDate() - 7);
            changeDate.val(sevenDaysAgo.getFullYear() + "-" +
                (sevenDaysAgo.getMonth() + 1).toString().padStart(2, '0') + "-" +
                sevenDaysAgo.getDate().toString().padStart(2, '0'));
			break;
		case "month" :
			changeDate.val(day.getFullYear()+"-"
			+(day.getMonth()).toString().padStart(2,'0')+"-"
			+ day.getDate().toString().padStart(2,'0'));
			break;
	}
}

function dateCheck(date) {
	var checkDate = $(date)
	var startDate = new Date($("#startDate").val())
	var endDate = new Date($("#endDate").val())
	
	if(startDate > endDate) {
		alert("날짜를 다시 선택해주세요")
		
		dateSetting()
	}
}