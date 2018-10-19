<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
  <style>
   .inputspan1{
     margin-left: 50px
   }
   .inputspan{
     margin-left: 70px
   }
   
 </style>

</head>

<body style="min-width:100px;background: url('img/timg.jpg') no-repeat;">
	
	<p style="text-align: center;">${requestScope.nlist.title}</p>
	
	
 
   
   
 <div style="margin-left: 20px;margin-top: 20px">
   ${requestScope.nlist.info}
   
   </div>
   
  <c:import url="/Model/form_footer.jsp" ></c:import>
  </body>