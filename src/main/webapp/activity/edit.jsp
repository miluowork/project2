<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
<head>
<style type="text/css">
.box {
padding-left: 130px;
	width: 420px;
	height: 100px;
}
.inputdiv{
float: left;
margin-left: 40px;
margin-top: 20px;

}

.inputview{
	padding-top: 40px
}
.inputview1{
	padding-top: 40px
}
.unitbox {
	width: 70px;
	height: 20px;
	margin: 10px;
	display: inline-block;
	position: relative;
	border: 0;
}
.unit0, .unit1 {
	width: 10px;
	height: 10px;
	background-color: blue;
	color: white;
	display: inline-block;
	border: 0;
	position: relative;
}

.cunit {
	margin-bottom: 10px
}

.br {
	display: block;
}
.inputspan1 {
	height: 70px;
}

.inputspan {
	height: 70px;
}
.inputtext, .inputtextarea {
	padding-left: 5px; 
	} 
	.inputtext{
	margin-left:30px;
	}
	
a :link {
	color: #00F;
	text-decoration: none;
}
.inputtextarea{
	border:1px solid #BABABA;
	width: 450px;
	height: 90px;
	resize:none;
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
}

#tabs0 {
	height: 400px;
	width: 580px;
}

.menu0 {
	width: 580px;
}

.menu0 li {
	display: block;
	float: left;
	padding: 4px 0;
	height: 30px;
	line-height: 30px;
	width: 161px;
	cursor: pointer;
	background: #FFFFff;
	border: #bbb solid 1px;
	margin: 0;
	text-align: center;
}

.menu0 li.hover {
	background: #f2f6fb;
}

.viewlist input {
	height: 30px;
	border: #bbb solid 1px;
}

.viewlist select {
	height: 30px;
	border: #bbb solid 1px;
}

.viewlist label {
	height: 30px;
}

#main0 ul {
	display: none;
}

#main0 ul.block {
	display: block;
}
</style>
</head>

<body style="min-width: 100px;">
	<script type="text/javascript">
		function setTab(m, n) {

			var tli = document.getElementById("menu" + m).getElementsByTagName(
					"li");

			var mli = document.getElementById("main" + m).getElementsByTagName(
					"ul");

			for (i = 0; i < tli.length; i++) {

				tli[i].className = i == n ? "hover" : "";

				mli[i].style.display = i == n ? "block" : "none";

			}

		}
	</script>
	<script>
		$(function() {
			var o = $(".selectinfo");
			$(o).each(function() {
				selectinfo(this,$(this).attr("url"));
			});
		});

		selectinfo = function(o,text) {
			$.ajax({
				url : text,
				type : "post",
				data : {
					where : $(o).attr("term")
				},
				dataType : "json",
				success : function(json) {
					for (var i = 0; i < json.length; i++) {
						if (json[i].id == $(o).attr("val")) {
							$(o).append(
									"<option value='"+json[i].id+"' selected='selected'>"
											+ json[i].name + "</option>");
						} else {
							$(o).append(
									"<option value='"+json[i].id+"'>"
											+ json[i].name + "</option>");
						}

					}
				}
			});
		}

		function edit() {
			var ops = new Array();
			$(".ounit").each(function() {
				ops.push($(this).val());
			});
			$(".options").val(ops);

			var cor = new Array();
			$(".cunit").each(function() {
				cor.push($(this).val());
			});
			$(".course").val(cor);

			event.srcElement.disabled = true;
			var data = $(".f1").serialize();
			$.ajax({
				url : $(".f1").attr("action"),
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
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

	<c:if test="${requestScope.info==null}">
		<form class="f1" action="activity/insert_json">
	</c:if>
	<c:if test="${requestScope.info!=null}">
		<form class="f1" action="activity/update_json">
			<input type="hidden" name="id" value="${info.id}" />
	</c:if>

	<div id="tabs0">
		<ul class="menu0" id="menu0">
			<li onclick="setTab(0,0)" class="hover">基本信息</li>
			<li onclick="setTab(0,1)">配置信息</li>
			<li onclick="setTab(0,2)">警告备注</li>
		</ul>

		<div class="main" id="main0" style="width: 700px; padding: 0px;">
			<ul class="block">
				<div class="inputview">
					<span style="margin-left:40px" class="inputspan1"> <label
						class="inputtext">活动名称: </label> <input class="inputinput" id=""
						name="name" type="text" value="${info.name}" /><label
						class="inputtext">类型: </label> <select name="type"
						class="inputtext searchinput inputselect_long"
						style="width: 100px">
							<c:forEach items="${requestScope.types}" var="t" varStatus="ts">
								<c:if test="${info.type==ts.index}">
									<option value="${ts.index}" selected="selected">${t}</option>
								</c:if>
								<c:if test="${info.type!=ts.index}">
									<option value="${ts.index}">${t}</option>
								</c:if>
							</c:forEach>
					</select>
						
						</span> 
					
					<input type="hidden" name="operator_id" value="1" />
					<!-- ${sessionScope.user.id} -->
					<input type="hidden" name="createdate"
						value="${info.createdate?1:info.createdate}" />
					<!-- ${sessionScope.user.id} -->

					<span style="margin-left:40px" class="inputspan1"> 
					 <label
						class="inputtext">指导员: </label> <!-- 辅导员下拉框--> <select
						name="instructor_user_id"
						class="selectinfo inputtext searchinput inputselect_long" term="where type=1" url="activity_user/index_json" style="width: 100px"
						val="${info.instructor_user_id}">
						<option value="0" selected="selected">未指定</option>
					</select> 
					<c:if test="${requestScope.info==null}">
							<label class="inputtext">发起人: </label> <select
							name="source_operator_id"
							class="selectinfo inputtext searchinput inputselect_long"
							url="activity_operator/index_json"
							term=" " style="width: 100px"
							val="${info.source_operator_id}">
						</select>
					</c:if>
					</span>
					<c:if test="${requestScope.info!=null}">
						<input hidden="hidden" name="source_operator_id"
							value="${info.source_operator_id}">
					</c:if>
					<span style="margin-left:40px" class="inputspan1">  
					<!-- 负责人下拉框  --> <label class="inputtext">负责人: </label> <select
						name="charge_operator_id"
						class="selectinfo inputtext searchinput inputselect_long"
						url="activity_operator/index_json"
						term="where type=1" style="width: 100px"
						val="${info.charge_operator_id}">
					</select>
					<label class="inputtext">状态: </label> <select name="status"
						class="inputtext searchinput inputselect_long"
						style="width: 100px">
							<c:forEach items="${requestScope.status}" var="s" varStatus="ss">
								<c:if test="${info.status==ss.index}">
									<option value="${ss.index}" selected="selected">${s}</option>
								</c:if>
								<c:if test="${info.status!=ss.index}">
									<option value="${ss.index}">${s}</option>
								</c:if>
							</c:forEach>
					</select>
					</span>
					<div class="inputdiv">
						<span><label class="inputtext" style="position: relative;">课程信息:
						</label> <input style="position: relative;width: 350px" class="inputinput"  name="courseinfo" value="${info.courseinfo}"></span>
					</div>
				</div>
					
			</ul>
			<ul>
				<div class="inputview1">
					<span>
					<%-- 
						<div class="courses" num="1" style="margin-left:; float: left;">
							<lable>课程计划 </label>
							<br>
							<input hidden="hidden" value="" class="course" name="courseinfo">
							<c:forEach items="${requestScope.courselist}" var="l"
								varStatus="ls">
								<span class='br'><input class="inputinput cunit"
									style="top: 0px; display: inline-block;" id="" value="${l}" />
								<button type='button' onclick="deletediv(this)">删除此条记录</button></span>
							</c:forEach> <span class='br'><input class="inputinput cunit" id=""
								value="" style="top: 0px; display: inline-block;" />
							<button type='button' onclick="deletediv(this)">删除此条记录</button></span>
							<button type='button' onclick='adddiv(this)'>下一个</button>
						</div>
					--%>
					    <span style="margin-left:40px" class="inputspan1"> <label
						class="inputtext">学校: </label> <input class="inputinput" id=""
						name="school" type="text" value="${info.school}" /> <label
						class="inputtext">专业: </label> <input class="inputinput" id=""
						name="college" type="text" value="${info.college}" /></span> 
					<br>
						<div style="margin-top: 10px">
						<span style="margin-left:40px;height: 40px;margin-top: 20px" class="inputspan1"> <label
						class="inputtext">计划人数: </label> <input class="inputinput" id=""
						name="count" type="number" value="${info.count}" style="width: 70px"/> <label
						class="inputtext" style="margin-left:100px">班级数: </label> <input class="inputinput" id=""
						name="classcount" type="number" value="${info.classcount}" style="width: 70px"/></span>
						</div>
					<div style="display: inline-block;margin-left:40px;margin-top:20px;position: relative;">
						<label class="inputtext">道具: </label>
							<input type="text" class="options" hidden="hidden" name="options">
							<c:forEach items="${requestScope.tools}" var="l" varStatus="ls">
								<div class="unitbox">
									<label>${l}</label>
									<c:if test="${requestScope.info!=null}">
										<c:if test="${requestScope.optionlist[ls.index]==1}">
											<input type="checkbox" class="ounit"
												onclick="ounitclick(this)" value="1" checked="checked">
										</c:if>
										<c:if test="${requestScope.optionlist[ls.index]==0}">
											<input type="checkbox" class="ounit"
												onclick="ounitclick(this)" value="0">
										</c:if>
									</c:if>
									<c:if test="${requestScope.info==null}">
										<input type="checkbox" class="ounit"
											onclick="ounitclick(this)" value="0">
									</c:if>
								</div>
							</c:forEach>
							</div>
				
					<div class="inputdiv">
						<span><label class="inputtext" style="position: relative;">日期信息:
						</label> <input style="position: relative;width: 350px" class="inputinput"  name="dateinfo" value="${info.dateinfo}"></span>
					</div>
					<div class="inputdiv">
						<span><label class="inputtext" style="position: relative;">计划信息:
						</label> <input style="position: relative;width: 350px" class="inputinput"  name="planinfo" value="${info.planinfo}"></span>
					</div>
					<br>
					
					</span>
				</div>
			</ul>
			<ul>
				<div class="inputview1">
				<div style="position: relative;">
				<span style="margin-left:100px ; margin-top: "
					class="inputspan1"> <label class="inputtext" style="display: block;">注意！！: </label>
					<textarea style="position: relative;resize:none;" class="inputtextarea" name="attention" rows="" cols="">${info.attention}</textarea>
				</span>
				</div>
				<div style="position: relative;">
				<span style="margin-left:100px ; margin-top: 50px"
					class="inputspan1"> <label class="inputtext" style="display: block;">备注: </label>
					<textarea style="position: relative;resize:none;" class="inputtextarea" name="comments" rows="" cols="">${info.comments}</textarea>
				</span>
				</div>
				<div style="position: relative;">
				<input name="ids" value="${info.ids}" type="hidden"/>
				<%-- <span style="margin-left:200px ; margin-top: 50px"
					class="inputspan1"> <label class="inputtext" style="display: block;">参与学生表: </label>
					<textarea style="position: relative;resize:none;" class="inputtextarea" name="ids" rows="" cols="">${info.ids}</textarea>
				</span> --%>
				</div>
				</div>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
/* 		deletediv = function(o) {
			var num=$(".courses").attr("num");
			$(o).prev().remove();
			$(o).remove();
			$(".courses").attr("num",--num);
		}
		adddiv = function(e) {
			var num=$(".courses").attr("num");
			if (num>6) {
				alert("长度超限");
			}else {
				$(e).remove();
				var o = $(".courses");
				o
						.append("<span class='br'><input class='inputinput cunit' value='' style='top: 0px;display: inline-block;' /><button onclick='deletediv(this)' type='button'>删除此条记录</button></span><button type='button' onclick='adddiv(this)'>下一个</button>")
			$(".courses").attr("num",++num);
			}
		} */
	</script>
	<script type="text/javascript">
		function ounitclick(o) {
			if ($(o).attr('checked')) {
				$(o).prop('value', 0);
			} else {
				$(o).prop('value', 1);
			}
		}
	</script>
	<div class="inputbtpanel">
		<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
		<button class="seachbt1" type="button" onclick="edit();">保存</button>
	</div>
	</div>
	</form>
	<c:import url="/Model/form_footer.jsp"></c:import>
</body>
