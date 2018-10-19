<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
<style type="text/css">
body {
	font: 18px "宋体";
	text-align: center;
}

a:link {
	color: #00F;
	text-decoration: none;
}

a:visited {
	color: #00F;
	text-decoration: none;
}

a:hover {
	color: #c00;
	text-decoration: underline;
}

ul {
	list-style: none;
}

.main {
	clear: both;
	padding: 8px;
	text-align: center;
}

#tabs0 {
	height: 320px;
	width: 580px;
}

.menu0 {
	width: 580px;
}

.menu0 li {
	display: block;
	float: left;
	padding: 4px 0;
	height:30px;
	line-height:30px;
	width: 161px;
	text-align: center;
	cursor: pointer;
	background: #FFFFff;
	border: #bbb solid 1px;
	margin: 0
}

.menu0 li.hover {
	background: #f2f6fb;
}
.viewlist input{
	height: 30px;
	border: #bbb solid 1px;
}
.viewlist select{
	height: 30px;
	border: #bbb solid 1px;
}
.viewlist label{
	height: 30px;
}

#main0 ul {
	display: none;
}

#main0 ul.block {
	display: block;
}

</style>
<script>
function setTab(m, n) {

		var tli = document.getElementById("menu" + m)
				.getElementsByTagName("li");

		var mli = document.getElementById("main" + m)
				.getElementsByTagName("ul");

		for (i = 0; i < tli.length; i++) {

			tli[i].className = i == n ? "hover" : "";

			mli[i].style.display = i == n ? "block" : "none";

		}

	}
	
	function pageParam(obj) {

	}

		
function edit() {
			if($("[name=name]").val()==""){
			MsgDialog("数据录入错误");
			return;
			}
			event.srcElement.disabled=true;
			var data = $(".f1").serializeArray();
			var classid=$("[name='classid']").val();
			var url="Projects/index";
			if(classid>0)url="Projects/insertall";
			$.ajax({
				url : url,
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				event.srcElement.disabled=false;
					if (json.status > 0) {
						
						parent.fresh();
						layer_close();
					}else{
					MsgDialog("保存失败，目录冲突");
					}
				}
			});
		}

</script>
<body style="min-width:100px;min-height:50px;">

	<form class="f1" >
	<c:if test="${requestScope.classid!=null}">
	<input type="hidden" name="classid" value="${requestScope.classid}">
	</c:if>
	<div id="tabs0">
				<ul class="menu0" id="menu0">
					<li onclick="setTab(0,0)" class="hover">项目信息</li>
					<li onclick="setTab(0,1)">图片信息</li>
				</ul>
	
	<div class="main" id="main0" style="width: 590px;padding: 0px;">
			<ul class="block">		
					<c:if test="${requestScope.info==null}">
						<input type="hidden" name="insert" />						
						<input type="hidden" name="student_id" value="${requestScope.student_id}" />
					</c:if>
					<c:if test="${requestScope.info!=null}">
						<input type="hidden" name="update" />
						<input type="hidden" name="id" value="${requestScope.info.id}" />
					</c:if>
					 <div class="inputview1">
				<span class="inputspan">
					<label class="inputtext">项目名称:
					</label> <input type="text" name="name"
						value="${requestScope.info.name}"
						class="inputinput" style="width:230px;"> 
						<label class="inputtext">目录名称:
					</label> 
					<c:if test="${requestScope.info!=null}">
					<c:if test="${requestScope.usermode>0}">
					<input type="text" name="path"
						value="${requestScope.info.path}"
						class="inputinput" style="width:50px;"> 
						</c:if>
						<c:if test="${requestScope.usermode==0}">
					<input type="text" readonly="readonly"  name="path" 
						value="${requestScope.info.path}"
						class="inputinput" style="width:50px;background-color: #ccc;"> 
						</c:if>
					</c:if>
						<c:if test="${requestScope.info==null}">
						<input type="text" name="path"
						value="${requestScope.info.path}"
						class="inputinput" style="width:50px;"> 
						</c:if>
					</span>
				<span class="inputspan1">
					<label class="inputtext">项目介绍:</label>
					<textarea class="inputarea1" name="info">${requestScope.info.info}</textarea>
				</span>
				<span class="inputspan">				
				<label class="inputtext">关键字:</label>
					<input class="inputinput" name="keys" 
						style=" width:395px;" value="${requestScope.info.keys}">
				</span>
				<span class="inputspan1">
					 <label class="inputtext">备注:</label>
					<textarea class="inputarea1" name="comments"
						style=" width:400px; ">${requestScope.info.comments}</textarea>
				</span></div>
			</ul>
			<ul>
			 <div class="inputview1">
			<span class="inputspan1" style="height:230px;">
			<c:set var="path" value='Web_Logo' scope="request"></c:set>
			<c:import url="../Model/UserUpload.jsp"></c:import>
			</span>
			</div>
			</ul>
			<div class="inputbtpanel" style="margin-top: -20px" >
				<button class="seachbt1" onclick="layer_close();">取消</button>
				<button class="seachbt1" type="button" onclick="edit();">保存</button>
			</div>
		</div>
		</div>
	</form>

	
  <c:import url="/Model/form_footer.jsp" ></c:import>
