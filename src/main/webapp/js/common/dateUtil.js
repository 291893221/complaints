function getWeek01(){
	var now = new Date;
	var day = now.getDay();
	var week = "7123456";
	var first = 0 - week.indexOf(day) -7;
	var week01 = new Date;
	week01.setDate(week01.getDate() + first);
	return week01;
}

function getWeek07(){
	var now = new Date;
	var day = now.getDay();
	var week = "7123456";
	var last = 6 - week.indexOf(day) - 7;
	var week07 = new Date;
	week07.setDate(week07.getDate() + last);
	return week07;
}

function setDateWeek(){
	var week01 = getWeek01();
	var week07 = getWeek07();
	$("#start").datebox("setValue", myformatter(week01));
	$("#end").datebox("setValue", myformatter(week07));
}