<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:import url="/Model/list_head.jsp" ></c:import>
<script>
var stype=${requestScope.studentinfo.blackpoint};
function fresh(){
var studentid = $("[name=studentid]").val();
		var classid = $("[name=classid]").val();
location.href="Projects/seach?studentid="+studentid + "&classid=" + classid;
}
function openurl(id,path){
if(typeof(situ)!="undefined"){
        situ.openurl("OnlineFileManagerServlet?command=picshow&id="+id+"&path="+path);
      }else{
window.open ("OnlineFileManagerServlet?command=picshow&id="+id+"&path="+path, '_new');
}
}
function setpoint(id){
layer_show("评价分数","Projects/editpoint?id="+id,320,180);
}
function returnobject(o){
	
	}
function openwin(){
	var studentid = $("[name=studentid]").val();
	layer_show("项目信息","Projects/edit?studentid="+studentid,600,380);
	}
function openwin1(){
	var classid = $("[name=classid]").val();
	location.href="Projects/seach_class?classid="+classid;
	}
function openwin3(){
	var studentid = $("[name=studentid]").val();
	location.href="Projects/amountdetails?studentid="+studentid;
}
function openwin4(){
var studentid = $("[name=studentid]").val();
var type=stype==0?1:0;
$.getJSON("Student/blackpoint",{studentid:studentid,type:type},function(json){
if(json.status>0) {
if (type==1) $(".black c").text("解除黑名单");
else  $(".black c").text("加入黑名单");
MsgDialog("状态修改成功");
}
});
}
	function openwin2(){
	var classid = $("[name=classid]").val();
	location.href="Projects/seach_course?classid="+classid;
	}
	function openedit(id){
	layer_show("项目信息","Projects/edit?id="+id,600,380);
	}


function openalllock(c) {
		var all = "";
		for ( var i = 0; i < $(".sub").size(); i++) {
			var d = $(".sub").get(i);
			if (d.checked) {
				all += d.value + ",";
			}
		}
		all = all.substring(0, all.length - 1);
		if (all.length == 0) {
			MsgDialog("请选中列表记录后再试、");
		} else {

			$.getJSON("Projects/alllock", {
				lock : c,
				ids : all
			}, function(json) {
				if (json.status > 0)
					fresh();
			});
		}

	}
	function openlock(id, c) {
		$.getJSON("Projects/lock", {
			id : id,
			lock : c
		}, function(json) {
			if (json.status == 1)
				fresh();
		});
	}
</script>


</head>


<body>
	 <span class="printtitle"></span>
     <form action="Projects/seach" method="post">
      <div class="searchview">
     <c:if test="${requestScope.usermode==0}">
    <label class="searchtext">班级:</label>
    <input name="classid" type="hidden" value="${requestScope.classinfo.id}">
				<b1 class="input">${requestScope.classinfo.name}</b1>
	 <label class="searchtext">学生:</label>
	 <input name="studentid" type="hidden" value="${requestScope.studentinfo.id}">
				<b1 class="input">${requestScope.studentinfo.name}</b1>
    </c:if>
    <c:if test="${requestScope.usermode!=0}">
    <c:set var="onchange" value="student" scope="request" ></c:set>
   <c:import url="/Model_List/list_class.jsp"></c:import>
   <c:import url="/Model_List/list_student.jsp"></c:import>
    </c:if>
        <button class="seachbt myseach" type="submit"  style="visibility: hidden;">查询</button>
         <c:if test="${requestScope.usermode<3}">
       	<button class="seachbt" onclick="openwin();" type="button">新增</button>
       	</c:if>
       	 <c:if test="${requestScope.usermode==1000000000}">
       	<button class="seachbt" onclick="openwin3();" type="button">评分</button>
       	</c:if>
       	  <c:if test="${requestScope.usermode==2111111111}">
       		<button class="seachbt" onclick="openwin4();" type="button">黑名单</button>
       		</c:if>
       		<button class="seachbt1" onclick="openwin1();" type="button">班级项目</button>
       		<button class="seachbt1" onclick="openwin2();" type="button">课程项目</button>
       <c:if test="${requestScope.usermode==2||requestScope.usermode==1}">
						<button class="seachbt " type="button" onclick="openalllock(1);">批量锁定</button>
						<button class="seachbt " type="button" onclick="openalllock(0);">批量解锁</button>
		</c:if>
       
       </div>
        </form>
        
		<table class="tablelist">
			<thead>
				<tr>
				<th width="3%"><input class="allcheck" type="checkbox" value="" />
				</th>
					<th width="50%" class="bigtext">项目名称</th>
					<th width="10%">综合分</th>
					<th width="15%">评价1</th>
					<th width="15%">评价2</th>
					<th width="7%">级别</th>
					<th width="7%">大小</th>
					<th width="4%" class="bigtext">备注</th>
					<th width="36%">操作</th>
				</tr>
			</thead>

			<tbody>
			<tbody>
				<c:forEach items="${requestScope.list}" var="row">
					<tr >
					<td><input class="sub" type="checkbox" value="${row.id}" /></td>
					<c:if test="${fn:length(row.logoUrl)>0}">
					<td ><img src="${row.logoUrl}" width="40" height="40" style="margin: 5px;"/><b>${row.name}</b></td>
					</c:if>
					<c:if test="${fn:length(row.logoUrl)==0}">
					<td><b>${row.name}</b></td>
					</c:if>
						<td>${row.average}</td>
						<td>${row.average1}</td>
						<td>${row.average2}</td>
						<td>${row.level_text}</td>
						<td>${row.size}M</td>
						<td>${row.comments}</td>
						<td>
						 <c:if test="${requestScope.usermode<3}">
						 <c:if test="${requestScope.usermode>0||row.lock==0}">
						<a href="javascript:openedit(${row.id});" class="tablelink" >修改</a>
						</c:if>
						</c:if>
						<c:if test="${row.path!=''}">
						<a href="javascript:openurl(${requestScope.classinfo.id},'${row.path}');" class="tablelink" >站点查看</a>
						</c:if>
						<c:if test="${row.course_id>10000}">						
						<a href="javascript:setpoint(${row.id});" class="tablelink" >评价</a>
						</c:if>
						 <c:if test="${requestScope.usermode<3}">
						  <c:if test="${requestScope.usermode>0||row.lock==0}">
						  <c:if test="${row.path!=''}">
						  <a href="fileManager?id=${row.id}" class="tablelink" >文件管理</a>
						  </c:if>
						  </c:if>
						
						</c:if>
						    <c:if test="${requestScope.usermode==102}">
						<a href="Projects/details?id=${row.id}" class="tablelink" >评价记录</a>
						</c:if>
						
						<c:if test="${requestScope.usermode==2||requestScope.usermode==1}">
										<c:if test="${row.lock==0}">
											<a href="javascript:openlock(${row.id},1);">锁定</a>
										</c:if>
										<c:if test="${row.lock==1}">
											<a href="javascript:openlock(${row.id},0);" style="background: #a88">解锁</a>
										</c:if>
						</c:if>
						</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
<script type="text/javascript">
if (stype==1) $(".black c").text("解除黑名单");
else  $(".black c").text("加入黑名单");
</script>
		
		<c:import url="/Model/list_footer.jsp" ></c:import>
