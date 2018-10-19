<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="../">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery/1.9.1/jquery.min.js"></script>
<script src="js/jquery/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="js/laydate/laydate.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="js/situ.js"></script>
<script type="text/javascript" src="js/jquery/jquery.jqprint-0.3.js"></script>
<link rel="stylesheet" type="text/css" href="js/Hui-iconfont/1.0.8/iconfont.css" />

<script>
function  myprint(obj){
if(obj){
 obj.jqprint();
}else{
 $("#print").jqprint();
}
       
    }
function openpass1(id){
layer_show('修改密码','Operator/updatepass.jsp?id='+id,340,210);
}
function openhelp1(){
layer.open({
  type: 2,
  scrollbar :true,
  title: false,
  closeBtn: 0	,
	area: ['880px', '80%'],
  shadeClose: true,
  skin: 'layui-layer-demo',
  shadeClose: true,
  content: "help1.html"
});
}
function openhelp2(){
layer.open({
title: "思途管理系统-学生规范", //不显示标题
  type: 2,
  scrollbar :true,
  title: false,
  closeBtn: 0	,
	area: ['880px', '80%'],
  shadeClose: true,
  skin: 'layui-layer-demo',
  shadeClose: true,
  content: "help2.html"
});
}
function paizhao(url){
layer_show('拍照','Model/Media.jsp?url=',335,330);
}
function openpass2(id){
layer_show('修改密码','Student/updatepass.jsp?id='+id,340,210);
}

function returndata(url){
$.ajax({url:'Student/updateurl',type:'post',data:{url:url},dataType:'json',success:function(json){

}});
}
function myshow(o){
var a=$(o);
layer.tips(a.text(),o,{
  tips: 3
});
}

function showinfo(json){

layer.open({
  type: 0,
  scrollbar :true,
  title: false,
  closeBtn: 0	,
  shadeClose: true,
  skin: 'layui-layer-demo',
  content: "<b style='font-size: 16px;'>"+json.title+"</b><br/>"+json.info,
  end:function(){
 	$.getJSON("Announcement/updatecount",{id:json.id},function(){});
  }
});
}
</script>