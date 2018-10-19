<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
<script type="text/javascript">
</script>
<style>
textarea {
   resize:none;
   border: 1px solid greenyellow;
   margin-top: 0px;
   margin-left:45px!important;
   position:absolute;
   overflow-y:scroll;  
}
.summary,.proposal{
   position:absolute;
   margin-top:0px!important;
  
   float: left;
   
}
.xx{
margin-top:50px!important;
position:relative !important;
} 

</style>
</head>

<body style="min-width:100px;">
<script>	
		function str(){
			var opt=$(".opt").val();
			if(opt==null){
			var strs="";
			$("input[type='radio']:checked").each(function(i){
				var every=$("input[type='radio']:checked").eq(i).val();
				strs +=every+",";
				alert(strs);
			});
			strs = strs.substring(0,strs.length-1);
			opt +=strs;
			$(".opt").val(strs);
			}else{
				var strs="";
				$("input[type='radio']:checked").each(function(i){
					var every=$("input[type='radio']:checked").eq(i).val();
					strs +=every+",";
					alert(strs);
				});
				strs = strs.substring(0,strs.length-1);
				opt +=","+strs;
				$(".opt").val(strs);
			}
			alert($(".opt").val());
		} 

</script>
<div class="inputview">
				<span class="inputspan">
					<label class="inputtext">调查情况:</label> 
				</span>
				<c:forEach items="${requestScope.questions}" var="r" varStatus="v">
				
				<span class="inputspan">
				<%-- <input type="hidden" name="answer" value="${v.index}"/> --%>
				&nbsp;&nbsp;&nbsp;
					 ${v.count}.${r}
					<br>
					    <c:if test="${v.index!=3}">
					    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					         <c:forEach items="${requestScope.option1}" var="rr" varStatus="vv">
					               <c:if test="${requestScope.opt[v.index]==vv.index}">
					                    <input type="radio" checked="checked" name="rad+${v.index}" class="ounit" value="${vv.index}"  >
					                     ${rr}
					               </c:if>
					         </c:forEach>
					    </c:if> 
					    <c:if test="${v.index==3}">
					     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					         <c:forEach items="${requestScope.option2}" var="rr" varStatus="vv">
					                   <c:if test="${requestScope.opt[v.index]==vv.index}">
					                        <input type="radio" checked="checked"  name="rads" class="ounit" value="${vv.index}" >
					                          ${rr}
					                   </c:if>
					         </c:forEach>
					    </c:if>   
				</span> 
				
				<br>
				</c:forEach>
</div>				
				
				
	
  <c:import url="/Model/form_footer.jsp" ></c:import>