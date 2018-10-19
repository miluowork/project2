<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script>
 !function(){
 
 
 
 $(".laydate-icon").attr("readonly","readonly");
laydate.skin('molv');
laydate({elem: '.Calendar',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false});
laydate({elem: '.Calendar1',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false});
laydate({elem: '.Calendar2',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false});
laydate({elem: '.Calendar3',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false});
laydate({elem: '.Calendar4',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false});
laydate({elem: '.Calendar5',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false});
laydate({elem: '.longCalendar',format:'YYYY年MM月DD日 hh:mm',istime:true});
laydate({elem: '.longCalendar100',format:'YYYY年MM月DD日 hh:mm',istime:true});
laydate({elem: '.longCalendar1',format:'YYYY年MM月DD日 hh:mm:ss',istime:true});
laydate({elem: '.longCalendar2',format:'YYYY年MM月DD日 hh:mm:ss',istime:true});
laydate({elem: '.longCalendar3',format:'YYYY年MM月DD日 hh:mm:ss',istime:true,min:laydate.now(-15),max: laydate.now(+15)});
laydate({elem: '.longCalendar4',format:'YYYY年MM月DD日 hh:mm:ss',istime:true,min:laydate.now(-15),max: laydate.now(+20)});
laydate({elem: '.Calendar11',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false,min:laydate.now()});
laydate({elem: '.longCalendar10',format:'YYYY年MM月DD日 hh:mm:ss',istime:true,min:laydate.now(),max: laydate.now(+7)});
laydate({elem: '.longCalendar11',format:'YYYY年MM月DD日 hh:mm:ss',istime:true,min:laydate.now(),max: laydate.now(+10)});
}();
 
$(function(){
$(document).on("click",".fexp",function(){
	layer.tips($(this).attr("text"), $(this), {
 	tips: [1, '#111111'] //还可配置颜色
});
});
});
</script>

</body>
</html>