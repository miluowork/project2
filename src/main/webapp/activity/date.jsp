<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<html>
<head>
<title>Insert title here</title>
</head>
<body  style="overflow:hidden">
	<div class="" style="width: 420px" >
	<!-- 	<input type="text" class="layui-input" id="test1" style="width: 100px;background: red"> -->
	<textarea rows="" cols="" style="width: 100%;height: 100;resize:none">
		${requestScope.list}
	</textarea>
		
	</div>	
</body>
</html>