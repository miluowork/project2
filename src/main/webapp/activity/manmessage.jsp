<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
lable{
	position: block;
}
</style>
</head>
<body style="overflow:hidden">
<div style="text-align: center;width:150px;height:200px">
<label>发起人:${requestScope.id1}</label><br>
<label>操作员:${requestScope.id2}</label><br>
<label>指导员:${requestScope.id3}</label><br>
<label>负责人:${requestScope.id4}</label><br>
</div>
</body>
</html>