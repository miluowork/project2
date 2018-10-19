<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<head>
<style type="text/css">
	.units{
		width:10px;height: 10px;
		background-color: gray;
	}
</style>
</head>
<body  style="overflow:hidden">
	<div style="width: 420px">
	<!-- 	<input type="text" class="layui-input" id="test1" style="width: 100px;background: red"> -->
	<script>
	</script>
		<textarea rows="" cols="" style="width: 100%;height: 100%;resize:none">
		${requestScope.list}
		</textarea>
	</div>	
</body>
</html>