<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/Model/form_head.jsp" ></c:import>
<style type="text/css">
body {
	font: 18px "宋体";
	text-align: center;
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



.menu0 {
	width: 600px;
}

.menu0 li {
	display: block;
	float: left;
	padding: 4px 0;
	height:30px;
	line-height:30px;
	width: 150px;
	text-align: center;
	cursor: pointer;
	background: #FFFFff;
}

.menu0 li.hover {
	background: #54f2e4;
}
.viewlist input{
	height: 30px;
}
.viewlist select{
	height: 30px;
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
</script>
</head>
<script type="text/javascript">
	function edit() {
		if (name1.value == "") {
			MsgDialog("必须录入名称！", "录入错误");
			return;
		}
		event.srcElement.disabled=true;
		var data = $(".f1").serializeArray();
		$.ajax({
			url : "Entrance_Company/index",
			type : "post",
			data : data,
			dataType : "json",
			success : function(json) {
			event.srcElement.disabled=false;
				if (json.status > 0) {
					parent.fresh();
					layer_close();

				}
			}
		});
	}
	
	function pageParam(obj) {

	}
</script>
<body style="min-width:200px;">
		<form class="f1">
				<ul class="menu0" id="menu0">
					<li onclick="setTab(0,0)" class="hover">企业信息</li>
					<li onclick="setTab(0,1)">联系方式</li>
					<li onclick="setTab(0,2)">招聘信息</li>
					<li onclick="setTab(0,3)">其他信息</li>
				</ul>
				
				<div class="main" id="main0">
				<c:if test="${requestScope.info==null}">
							<input type="hidden" name="insert" /> 
							</c:if>
							<c:if test="${requestScope.info!=null}">
								<input type="hidden" name="update" /> 
								<input type="hidden" name="id" value="${requestScope.info.id}"> 
							</c:if>
					<ul class="block">
						<li>
						<div class="inputview1">
						<span class="inputspan"> 
								<label class="inputtext" >企业名称: </label>
								<input class="inputinput" type="text" id="name1" name="name" value="${requestScope.info.name}" style=" width:400px;"> 
								</span>
								<span class="inputspan"> 
								<label class="inputtext" >性质:</label> 
								<select class="inputselect" name="quality"
							style="width: 150px;">
							<c:forEach var="r" items="${requestScope.quality}" varStatus="v">
								<c:if test="${requestScope.info.quality==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.quality!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
							</c:forEach>
							</select> 
								<label class="inputtext" >城市:</label> 
								<input class="inputinput" type="text" name="city" value="${requestScope.info.city}" style="width:150px;">
								
								</span>
								<span class="inputspan"> 
								<label class="inputtext" >地址:</label> 
								<input class="inputinput" type="text" name="address" value="${requestScope.info.address}" style="width:400px"><br/> 
								</span>
								
								<span class="inputspan"> 
								<label class="inputtext" >网址:</label> 
								<input class="inputinput" type="text" name="url" value="${requestScope.info.url}" style="width:150px;">
								<label class="inputtext" >渠道:</label> 
								<select class="inputselect" name="channel"
							style="width: 150px;">
							<c:forEach var="r" items="${requestScope.channel}" varStatus="v">
								<c:if test="${requestScope.info.channel==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.channel!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
							</c:forEach>
							</select> 
								</span>
								<span class="inputspan"> 
								<label class="inputtext">简介: </label> 
								<textarea class="inputinput"  name="introductions" style="width:400px;">${requestScope.info.introductions}</textarea>	
							</span>
							</div>
					</li>
					</ul>
					
					
					
				<ul>
					<li><div class="inputview1">
						<span class="inputspan"> 
								<label class="inputtext" >联系人:</label> 
								<input class="inputinput" type="text" name="contacts" value="${requestScope.info.contacts}" style="width: 180px;">
								</span><span class="inputspan"> 
								<label class="inputtext" >电话:</label> 
								<input class="inputinput" type="text" name="tel" value="${requestScope.info.tel}" style="width: 180px;">
								</span><span class="inputspan"> 
								<label class="inputtext" >qq:</label> 
								<input class="inputinput" type="text" name="qq" value="${requestScope.info.qq}" style="width: 180px;"> 	
							</span>
							<span class="inputspan"> 
								<label class="inputtext" >微信:</label> 
								<input class="inputinput" type="text" name="weixin" value="${requestScope.info.weixin}" style="width: 180px;"> 	
							</span>
						</div>
					</li>
				</ul>
				<ul>
					<li><div class="inputview1">
					<span class="inputspan"> 
					<label class="inputtext" >职位:</label> 
						<c:forEach var="r" items="${requestScope.courselist}">
							<label class="inputtext" >${r.name}</label>
							<c:if test="${fn:indexOf(requestScope.info.job,r.id)>=0}">
							<input type="checkbox"  name="job" checked="checked" value="${r.id}" >
							</c:if>
							<c:if test="${fn:indexOf(requestScope.info.job,r.id)==-1}">
							<input type="checkbox"  name="job" value="${r.id}" >
							</c:if>
						</c:forEach>
					</span>
						<span class="inputspan"> 
								<label class="inputtext" >学生数量:</label> 
								<input class="inputinput" readonly="readonly" type="text" name="count" value="${requestScope.info.count}" style="width: 160px;"> 
								<label class="inputtext" >试用期:</label> 
								<input class="inputinput" type="text" name="probationPeriod" value="${requestScope.info.probationPeriod}" style="width: 160px;"> 
								</span><span class="inputspan"> 
								<label class="inputtext" >实习工资:</label> 
								<input class="inputinput" type="text" name="internshipWage" value="${requestScope.info.internshipWage}" style="width: 160px;"> 
								<label class="inputtext" >转正工资:</label> 
								<input class="inputinput" type="text" name="officialWage" value="${requestScope.info.officialWage}" style="width: 160px;"> 
								</span><span class="inputspan"> 
								<label class="inputtext"  >学历:</label> 
								<select class="inputselect" name="education"
							style="width: 55px;">
							<c:forEach var="r" items="${requestScope.education}" varStatus="v">
								<c:if test="${requestScope.info.education==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.education!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
							</c:forEach>
							</select> 
								<label class="inputtext" style="width:35px;" >经验:</label> 
	<select class="inputselect" name="experience"
							style="width: 55px;">
							<c:forEach var="r" items="${requestScope.experience}" varStatus="v">
								<c:if test="${requestScope.info.experience==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.experience!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
							</c:forEach>
							</select> 								
<label class="inputtext" style="width:35px;" >性别:</label> 
								
<select class="inputselect" name="sex"
							style="width: 55px;">
							<c:forEach var="r" items="${requestScope.sex}" varStatus="v">
								<c:if test="${requestScope.info.sex==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.sex!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
							</c:forEach>
							</select> 
<label class="inputtext" style="width:35px;" >其他:</label> 
								<input class="inputinput" type="text" name="request" value="${requestScope.info.request}" style="width: 90px;"> 
								
								</span>
								
								
								<span class="inputspan"> 
								<label class="inputtext" >福利待遇:</label> 
								<input class="inputinput" type="text" name="fringeBenefits"  value="${requestScope.info.fringeBenefits}" style="width: 425px;"> 		
							</span>
							<span class="inputspan"> 
								<label class="inputtext" >工作地址:</label> 
								<input class="inputinput" type="text" name="addr"  value="${requestScope.info.addr}" style="width: 425px;"> 		
							</span>
						</div>
					</li>
				</ul>
				<ul>
					<li><div class="inputview1">
						<span class="inputspan"> 
							<label class="inputtext" >使用状态:</label> 
							<select class="inputselect" name="status"
							style="width: 400px;">
							<c:forEach var="r" items="${requestScope.status}" varStatus="v">
								<c:if test="${requestScope.info.status==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.status!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
							</c:forEach>
							</select> 
							</span>
							<span class="inputspan"> 
							<label class="inputtext" >备注: </label> 
							<textarea class="inputinput"  name="comments" style="width:400px;">${requestScope.info.comments}</textarea>	
						</span></div>
					</li>
				</ul>
			</div>
		<div class="inputbtpanel" style="margin-top: -20px">
				<button class="seachbt1"  onclick="layer_close();">取消</button>
				<button class="seachbt1" type="button" onclick="edit();">保存</button>
		</div>
	</form>

  <c:import url="/Model/form_footer.jsp" ></c:import>
