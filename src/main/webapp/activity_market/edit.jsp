<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
<head>
<style type="text/css">
	.inputspan1{
	margin-top:20px;
		height: 50px;
	}
	.textarea{
		resize: none;width: 300px;height: 100px;
		border: 1px solid gray;
	}
</style>
</head>

<body style="min-width: 100px;">
	<script>
	</script>
	<script type="text/javascript">
			function edit() {
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
						}else{
							alert(json.text);
						}
					}
				});
			}
	</script>
<c:if test="${requestScope.info==null}">
	<form class="f1" action="activity_market/insert_json">
	<span style="margin-left: 140px" class="inputspan1"> 
	<label
			class="inputtext">选择活动: </label>
		<select name="activity_id" class="searchinput inputselect_long">
			<c:forEach items="${requestScope.activity}" var="a" varStatus="as">
				<option value="${a.id}">${a.name}</option>
			</c:forEach>
		</select> </span>
	</c:if>
	<c:if test="${requestScope.info!=null}">
	<form class="f1" action="activity_market/update_json">
	<input name="id" value="${info.id}" hidden="hidden">
	<input name="date" hidden="hidden" value="${info.date}">
	<input name="activity_id" value="${info.activity_id}"  hidden="hidden">
	</c:if>
	<input name="operator_id" hidden="hidden"
			value="1"> <!-- ${sessionScope.userid==null?sessionScope.userid:1} -->
	<input name="json" hidden="hidden" value="1">
		<div style="width: 100%;position: relative;display: block;margin-top: 60px" >
		 <span style="margin-left: 140px" class="inputspan1">
		 
		 <div style="float: left;display: inline-block;position: relative;"><label
			class="inputtext" style="float: left;display: inline-block;position: relative;">事情: </label>
			 <textarea rows="" cols=""
				name="info" class="textarea" >${info.info}</textarea></div>
		 <div style="float: left;display: inline-block;position: relative;"><label
			class="inputtext" style="float: left;display: inline-block;position: relative;">日总结: </label> 
			<textarea rows="" cols=""
				name="comments" class="textarea">${info.comments}</textarea></div>
		</div>	
	</form>
	<div class="inputbtpanel" style="bottom:10px ;margin-top: 30px;position: absolute;">
		<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
		<button class="seachbt1" type="button" onclick="edit();">保存</button>
	</div>

	<c:import url="/Model/form_footer.jsp"></c:import>
</body>