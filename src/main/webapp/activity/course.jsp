<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	</script>
	<head>
	</head>
<body  style="overflow:hidden">
	<div style="width: 420px" >
	<script>
	</script>
		<tr><c:forEach items="${requestScope.list}"  var="d" varStatus="ds">
				<td><label>${d}</label></td><br>
		</c:forEach></tr>	
	</div>
</body>
</html>