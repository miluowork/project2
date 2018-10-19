<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<head>
	<style type="text/css">
		.box{
			width: 420px;
			height:205px;
			background-color:white;		
			color:gray ;	
		}
		.unitbox{
			width: 100px;
			height:20px;
			margin: 10px;
			display:inline-block;
			position: relative;
			border: 0;
		}
		
		.unit0,.unit1{
			width:10px;
			height:10px;
			background-color:lime;/* lime */
			color: white;
			display: inline-block;
			border: 0;
			position: relative;
		}
		.unit0{
			background-color:activecaption;
		}
	</style>
</head>
<body style="overflow:hidden">
	<div class="box">
			<c:forEach items="${requestScope.list}" var="l" varStatus="ls">
				<c:if test="${l==1}">
					<div class="unitbox">	<div class="unit1">
					</div><label>${requestScope.tools[ls.index]}</label>
					</div>
				</c:if>	
			</c:forEach>
			<c:forEach items="${requestScope.list}" var="l" varStatus="ls">
				<c:if test="${l==0}">
					<div class="unitbox">	<div class="unit0">
					</div><label>${requestScope.tools[ls.index]}</label>
					</div>
				</c:if>	
			</c:forEach>
			<div style="position: relative;margin-top: 30px;float: right;">
			<div class="unitbox" style="width: 50px">	<div class="unit1" >
					</div><label>选中</label>
					</div><div class="unitbox">	<div class="unit0">
					</div><label>未选中</label>
					</div></div>
	</div>
</body>
</html>