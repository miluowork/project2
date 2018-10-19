<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
<head>
<style type="text/css">
	.inputspan, .inputspan1 {
   		 height: 60px;
	}
</style>
</head>

<body style="min-width: 100px;">
	<script>
		function edit() {
			event.srcElement.disabled=true;
			var data = $(".f1").serialize();
			$.ajax({
				url : $(".f1").attr("action"),
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
	<c:if test="${requestScope.info==null}">
		<form class="f1" action="activity_operator/insert_json">
	</c:if>
	<c:if test="${requestScope.info!=null}">
		<form class="f1" action="activity_operator/update_json">
			<input type="hidden" name="id" value="${info.id}" />
	</c:if>
	<div class="inputview">
		<span style="margin-left: 60px" class="inputspan"> <label
			class="inputtext ">权限: </label> <select name="power"
			style="width: 70px" class="searchinput inputselect_long">
				<c:forEach items="${requestScope.powerArray}" var="p" varStatus="pp">
					<c:if test="${info.power==pp.index}">
						<option value="${pp.index}" selected="selected" >${p}</option>
					</c:if>
					<c:if test="${info.power!=pp.index}">
						<option value="${pp.index}">${p}</option>
					</c:if>
				</c:forEach>
		</select>
	<label
			class="inputtext" style="margin-left: 30px">状态: </label> <select name="status" style="width: 70px" class="searchinput inputselect_long">
				<c:forEach items="${requestScope.statusArray}" var="s"
					varStatus="ss">
					<c:if test="${info.status==ss.index}">
						<option value="${ss.index}" selected="selected">${s}</option>
					</c:if>
					<c:if test="${info.status!=ss.index}">
						<option value="${ss.index}">${s}</option>
					</c:if>
				</c:forEach>
		</select>
		</span> 
		<input type="hidden"  name="pass" value="${info.pass}">
		<span style="margin-left: 60px" class="inputspan1"> <label
			class="inputtext">姓名: </label> <input class="inputinput" 
			name="name" value="${info.name}" style="width: 70px" />
		<label
			class="inputtext" style="margin-left: 30px">电话: </label> <input class="inputinput" 
			name="tel" type="tel" value="${info.tel}" style="width: 100px" />
		</span> <span style="margin-left: 60px" class="inputspan1"> <label
			class="inputtext">类型: </label>
			<select name="type" class="searchinput inputselect_long" style="width: 100px">
				<c:forEach items="${requestScope.typeArray}" var="t"
					varStatus="tt">
					<c:if test="${info.type==tt.index}">
						<option value="${tt.index}" selected="selected">${t}</option>
					</c:if>
					<c:if test="${info.type!=tt.index}">
						<option value="${tt.index}">${t}</option>
					</c:if>
				</c:forEach>
		</select>
		</span><span style=""> <label
			class="inputtext" style="float: left;position: relative;margin-left: 60px">备注: </label>
			<textarea rows="" cols="" style="resize: none;width: 250px;height:50px; border: solid 1px #BABABA;font-size:14px">
			${info.comments}
			</textarea> 
		</span>
		<div class="inputbtpanel">
			<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
			<button class="seachbt1" type="button" onclick="edit();">保存</button>
		</div>
	</div>
	</form>
	<c:import url="/Model/form_footer.jsp"></c:import>
</body>