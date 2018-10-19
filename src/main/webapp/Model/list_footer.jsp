<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script>

 !function(){
 
 $(".disbt").attr("disabled","disabled");
  $(".laydate-icon").attr("readonly","readonly");
laydate.skin('molv');
laydate({elem: '.Calendar',format:'YYYY年MM月DD日'});
laydate({elem: '.Calendar1',format:'YYYY年MM月DD日'});
$("body").attr('id','print');
$(".bigtext").mousedown(function(){myshow(this);});
if($("th input").size()>0){
$("th:first-child").addClass("printhide");
$("tr").find("td:first-child").addClass("printhide");
}
$("th a").addClass("printhide");
$(".headview").addClass("printhide");
$(".searchview").addClass("printhide");
$(".pagin").addClass("printhide");
if($(".field_panel").find(".tablelist").size()>0){

}else{
$(".field_panel").addClass("printhide");
}

var mt=$("th:last").text();
if(mt.substring(0,2)=='操作'){
$("th:last").addClass("printhide");
$("tr").find("td:last").addClass("printhide");
}


var printtitle=$(window.parent.document.getElementsByTagName("iframe")[0]);

var title="<div style='font-size:20px;text-align:center;font-weight:bold;padding-bottom:10px;'>"+printtitle.parent().prev().text()+"</div>";

title+="<div style='text-align:left;'>";
$(".searchview .searchtext").each(function(){
var tn=$(this).next().prop("tagName");

var v="";
if(tn=="SELECT"){
v=$(this).next().find("[selected=selected]").text();
}
if(tn=="INPUT"){
v=$(this).next().val();
}

if(tn=="label"){
v=$(this).next().text();
}

title+="<span style='font-size:16px;font-weight:bold;padding-right:20px;'>"+$(this).text()+v+"</span>";
});
title+="</div>";
$(".printtitle").css("display","block").html(title);

$(".printtitle").css({"font-size": "20px","text-align": "center","font-weight": "bold"});
$(".headprint").click(function(){
$("td>.dropdown").addClass("printhide");
myprint();
});

}();
</script>

</body>
</html>