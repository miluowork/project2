<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script>
function p(){
var a=pic.value;
layer_show("拍照","Model/Media.jsp?url="+a,335,330);
}
var apos=0;
function returndata(url){
img.src=url+"?a="+(apos++);
pic.value=url;
}
</script>
<span style="position: relative;margin-left: -280px;margin-top: 15px;" >
<img id="img" alt="点击拍照" onclick="p();" width="240" height="200" src="${requestScope.info.picUrl}" />
<input type="hidden" name="picUrl" id="pic" value="${requestScope.info.picUrl}"/>
</span>