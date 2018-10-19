/**************************************时间格式化处理************************************/
function dateFtt(fmt,date)   
{ //author: meizz   
  var o = {   
    "M+" : date.getMonth()+1,                 //月份   
    "d+" : date.getDate(),                    //日   
    "h+" : date.getHours(),                   //小时   
    "m+" : date.getMinutes(),                 //分   
    "s+" : date.getSeconds(),                 //秒   
    "q+" : Math.floor((date.getMonth()+3)/3), //季度   
    "S"  : date.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
}
function getFirstDayOfWeek (date,d) {
	if(!d)d=0;
    var day = date.getDay() || 7;
    return new Date(date.getFullYear(), date.getMonth(), date.getDate() + 1 - day+d);
}
function getMonthDays(date){ 
	var monthStartDate = new Date(date.getYear(), date.getMonth(), 1); 
	var monthEndDate = new Date(date.getYear(), date.getMonth() + 1, 1); 
	var days = (monthEndDate - monthStartDate)/(1000 * 60 * 60 * 24); 
	return days; 
} 
var mclick= function(e){
	var o=e.target;
	var a=$(o);
	layer.tips(a.text(),o);
	}

$(document).ready(function(){
	var isok=$('.tablelist tbody tr').hasClass("course1");
	if(!isok)isok=$('.tablelist tbody tr').hasClass("course2");
	if(!isok)isok=$('.tablelist tbody tr').hasClass("course3");
	if(!isok){
	$('.tablelist tbody tr:odd').addClass('odd');
	}
	var c=$("table").find(".bigtext").size();
	if(c >0 ) $("table").css({"table-layout":"fixed"});
	$(".bigtext").on("mousedown",mclick);
	
	$("button,a").click(function(){
		var nowTime = new Date().getTime();
		var clickTime = $(this).attr("ctime");
		if( clickTime != 'undefined' && (nowTime - clickTime < 1000)){
			MsgDialog("操作过于频繁，稍后再试");
			return false;
		}else{
			$(this).attr("ctime",nowTime);
		}       
	});
});

$(document).on("click",".allcheck",function(e){
var c=$(".allcheck").attr("checked");
	if(c){
		$(".sub").attr("checked","checked");
	}else{
		$(".sub").removeAttr();
	}	
});
$(document).on("click",".fieldset",function(e){
	var o=$("tmp").add(e.target);
		o.next().slideToggle(200);
	});

function MsgDialog(msg,title){
	layer.alert(msg);
}
function ConfirmDialog(msg,fn){
	return layer.confirm(msg, {
		  btn: ['同意','取消'] //按钮
	}, function(){
		 fn();
	});
}
function getmonthlist(select,j_month,j_button){
	$.ajax({
		url : "Class/getmonthlist",
		type : "post",
		data : {id:select.value},
		dataType : "json",
		success : function(json) {
			j_month.empty();
		var index=parseInt(json[0]);
		for(var i=1;i<json.length;i++){
			if(i==index) j_month.append($("<option selected='selected' value='"+(i)+"'>"+json[i]+"</option>"));
			else j_month.append($("<option value='"+i+"'>"+json[i]+"</option>"));
		}
		if(json.length==0){
			j_button.css("visibility","hidden");
		}else{
			j_button.css("visibility","visible");
		}
		}
	});
	
}
function getmonthalllist(select,j_month,j_button){
	$.ajax({
		url : "Class/getmonthlist",
		type : "post",
		data : {id:select.value},
		dataType : "json",
		success : function(json) {
			j_month.empty();
			var index=parseInt(json[0]);
			j_month.append($("<option value='-1'>全部</option>"));
		for(var i=1;i<json.length;i++){
			if(i==index) j_month.append($("<option selected='selected' value='"+(i)+"'>"+json[i]+"</option>"));
			else j_month.append($("<option value='"+(i)+"'>"+json[i]+"</option>"));
		}
		if(json.length==0){
			j_button.css("visibility","hidden");
		}else{
			j_button.css("visibility","visible");
		}
		}
	});
	
}
function getcollegelist(select,j_college,j_button,mark){
	$.ajax({
				url : "School_College/getcollegelist",
				type : "post",
				data : {id:select.value},
				dataType : "json",
				success : function(json) {
					j_college.empty();
					if(mark==1){
						j_college.append($("<option value='0'>全部学院</option>"));
					}
				for(var i=0;i<json.length;i++){
					j_college.append($("<option value='"+json[i].id+"'>"+json[i].name+"</option>"));
				}
				if(json.length==0){
					j_button.css("visibility","hidden");
				}else{
					j_button.css("visibility","visible");
				}
				}
			});
}
function getstudentlist(select,j_student,j_button){
	$.ajax({
				url : "Student/getstudentlist",
				type : "post",
				data : {id:select.value},
				dataType : "json",
				success : function(json) {
					j_student.empty();
				for(var i=0;i<json.length;i++){
					j_student.append($("<option value='"+json[i].id+"'>"+json[i].name+"</option>"));
				}
				if(json.length==0){
					j_button.css("visibility","hidden");
				}else{
					j_button.css("visibility","visible");
				}
				}
			});
}
function getmodelist(select,j_mode,j_button){
	$.ajax({
				url : "Rate_Mode/getmodelist",
				type : "post",
				data : {id:select.value},
				dataType : "json",
				success : function(json) {
					j_mode.empty();
					j_mode.append($('<option value="0">全部</option>'));
				for(var i=0;i<json.length;i++){
					j_mode.append($("<option value='"+json[i].id+"'>"+json[i].stageInfo+"</option>"));
				}
				if(json.length==0){
					j_button.css("visibility","hidden");
				}else{
					j_button.css("visibility","visible");
				}
				}
			});
}
function getsubmodelist(select,j_mode,j_button){
	if(select.value==0)return;
	$.ajax({
				url : "Rate_Mode/getsubmode",
				type : "post",
				data : {id:select.value},
				dataType : "json",
				success : function(json) {
					j_mode.empty();
					j_mode.append($('<option value="0">全部</option>'));
				for(var i=0;i<json.length;i++){
					j_mode.append($("<option value='"+json[i].id+"'>"+json[i].stageInfo+"</option>"));
				}
				if(json.length==0){
					j_button.css("visibility","hidden");
				}else{
					j_button.css("visibility","visible");
				}
				}
			});
}
function getmodelistbyclass(select,j_mode,j_button){
	$.ajax({
				url : "Rate_Mode/getmodelist_student",
				type : "post",
				data : {id:select.value},
				dataType : "json",
				success : function(json) {
					j_mode.empty();
					$("[name=submodeid]").empty();
					$("[name=submodeid]").append($('<option value="0">全部</option>'));
					j_mode.append($('<option value="0">全部</option>'));
				for(var i=0;i<json.length;i++){
					j_mode.append($("<option value='"+json[i].id+"'>"+json[i].stageInfo+"</option>"));
				}
				if(json.length==0){
					j_button.css("visibility","hidden");
				}else{
					j_button.css("visibility","visible");
				}
				}
			});
}
function gettasklist(j_class,j_task,j_button){
	var classid=j_class.val();
	$.ajax({
				url : "Task_Result/gettask",
				type : "post",
				data : {classid:classid},
				dataType : "json",
				success : function(json) {
					j_task.empty();
				for(var i=0;i<json.length;i++){
					j_task.append($("<option value='"+json[i].id+"'>"+json[i].title+"</option>"));
				}
				if(json.length==0){
					j_button.css("visibility","hidden");
				}else{
					j_button.css("visibility","visible");
				}
				}
			});
	
}
function getschoolclasslist(select,j_class){
	$.ajax({
		url : "School_Class/getclasslist",
		type : "post",
		data : {id:select.value},
		dataType : "json",
		success : function(json) {
			j_class.empty();
			j_class.append($('<option value="0">未指定</option>'));
		for(var i=0;i<json.length;i++){
			j_class.append($("<option value='"+json[i].id+"'>"+json[i].name+"</option>"));
		}
		}
	});
}
function getclasslist(j_lable,j_class,mark){
	$.ajax({
				url : "Class/getclasslist",
				type : "post",
				data : {mark:mark},
				dataType : "json",
				success : function(json) {
					j_class.empty();
				for(var i=0;i<json.length;i++){
					j_class.append($("<option value='"+json[i].id+"'>"+json[i].name+"</option>"));
				}
				if(mark==0){
					j_lable.text("当前班级：");
				}else{
					j_lable.text("全部班级：");
				}
				}
			});
}

function allseach(name,url) {
	layer_show("自定义查询("+$(".righttitle").text()+")","allseach?name=all&cmd="+name,500,300,function (sql){
 		if(url.indexOf("?")>0)
 			location.href = url+"&where= where "+sql;
 			else
		location.href = url+"?where= where "+sql;
	});
}