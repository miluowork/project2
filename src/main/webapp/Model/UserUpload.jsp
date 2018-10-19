<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value=""/>
<c:if test='${requestScope.path==null}'>
<c:set var="path" value='Student_Logo' scope="request"></c:set>
</c:if>
<script>
var path='${requestScope.path}';
	function s(){
	var myurl=pic1.value;
		var fileObj = document.getElementById("afile").files[0]; // 获取文件对象
		var fd = new FormData();
		fd.append("image", fileObj);
		fd.append("url", myurl);
		fd.append("mypath", "../uploadPic/"+path);
		var xhr = new XMLHttpRequest();
		xhr.open('POST', "Student/uploadPic", true);
		xhr.onreadystatechange = function() {
		if(xhr.readyState==4){
	var j=eval("("+xhr.responseText+")");
	if(j.status==1){
		img1.src=j.url;
		pic1.value=j.url;
	}
	}
		};
		xhr.send(fd);
		
	}
	
	function c(o){
	$(o).parent().prev()[0].src="../images/nopic.png";
	pic1.value="";
	}
</script>
<c:set var="style" value=""/>
<c:if test='${requestScope.style==null}'>
<c:set var="style" value='position: relative;'></c:set>
</c:if>
<span style="${style}">
	<c:if test="${requestScope.info.logoUrl==''}">
	<img id="img1" width="240" height="170" style="    position: relative;
    left: 10px;"
	src="../images/nopic.png" /> 
	</c:if>
	<c:if test="${requestScope.info.logoUrl!=''}">
	<img id="img1" width="240" height="170" style="    position: relative;
    left: 10px;"
	src="${requestScope.info.logoUrl}" /> 
	</c:if>
	
	<div style="position: relative;"  >
	<input type="file" id="afile" /><br />
<button class="seachbt" onclick="s();" type="button">上传</button>
<button class="seachbt" onclick="c(this);" type="button">清空</button>
</div>
	<span class="test"></span> </span>
<input type="hidden" name="logoUrl" id="pic1"
	value="${requestScope.info.logoUrl}" />