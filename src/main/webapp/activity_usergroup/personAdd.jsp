<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
<script type="text/javascript">
</script>
<style>
.s1{
width:100px;
}
.btns{
/* top:220px !important; */
margin-left:50px !important;
}
.txt{
margin-left:40px;
text-align:center;
font-size: 20px!important;
font-style: italic;
}

</style>
<script>
function save(){
	//id字符串
	 var str=""; 
	 $("input[type=checkbox]:checked").each(function(i){
		var s=$("input[type=checkbox]:checked").eq(i).val();
		str +=s+",";
	}) 
	str=str.substring(0,str.length-1);
	//名称字符串
	 var str1=""; 
	 $("input[type=checkbox]:checked").each(function(i){
		var s1=$("input[type=checkbox]:checked").eq(i).next().text();
		str1 +=s1+",";
	}) 
	str1=str1.substring(0,str1.length-1);
	//调用父方法
	var index = parent.layer.getFrameIndex(window.name);
	parent.getIds(str,str1);
		parent.layer.close(index);
		
	
	
	/* var opt=$(".opt").val();
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
	alert($(".opt").val()); */
	
	
};

</script>
</head>

<body style="min-width:100px;min-height:200px">

<c:if test="${requestScope.aulist!=null}">

		<div class="inputview">
			<c:forEach items="${requestScope.aulist}" var="r" varStatus="v">
				<span class="inputspan" style="padding: 0">
					    <input type="checkbox" style="margin-top:20px !important;width:20px;height:20px" value="${r.id}"/>
					    <label style="font-size:15px;font-weight:bold">${r.name}</label>
				</span>
			</c:forEach>
		</div>
		<br>
          <br>
           
		<div class="inputspan btns" >
			   <button class="seachbt1 " type="button" onclick="layer_close();">取消</button>
			   <button class="seachbt1 " type="button" onclick="save();">确定</button>
		</div>
</c:if>

<c:if test="${requestScope.aulist==null}">
         <br>
          <br>
         
		<div class="inputview txtDiv" style="margin-top: -30px!important;">
				<span class="inputspan">
					 <label class="txt">该活动成员已全部分组!</label>
				</span>
				
				<span class="inputspan">
					 <label class="txt" style="margin-left:100px!important;" >谢谢!</label>
				</span>
		</div>
</c:if>


	
  <c:import url="/Model/form_footer.jsp" ></c:import>