<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<head>
	<style type="text/css">
		.box{
			width: 520px;
			background-color:white;		
			color:gray ;	
		}
		.unitbox{
			width: 90px;
			height:20px;
			margin: 5px;
			display:inline-block;
			position: relative;
			border: 0;
		}
		.unit0,.unit1{
			width:10px;
			height:10px;
			background-color:green;
			color: white;
			display: inline-block;
			border: 0;
			position: relative;
		}
		.unit0{
			background-color:gray;
		}
	</style>
	<script type="text/javascript">
	function addstuwin(id){
		parent.index = window.name;
		parent.addstuwin(id);
	}
	function fresh() {
		var aid=${requestScope.aid}
		window.location.reload();
	}
	function tp(){
		var type=${sessionScope.user.type==null?0:sessionScope.user.type};
		if(type==1){//辅导员
			$(".ufdy").css("display","none");
		}
	};
	$(function(){
		tp();
	})
	</script>
</head>
<body style="max-width:620px;min-width:620px;width: 620px;overflow-x:hidden ">
<div class="ufdy" style="float: left;width: 100px;height:calc(100% - 30px);text-align: center;margin-top: 30px;position:fixed;display: inline-block;"><a class="tablelink" onclick="deleteall()">删除选中</a><br>
	<a href="javascript:void(0);"  class="tablelink" onclick="addstuwin('${requestScope.aid}');">添加学生</a></div> 
	<div class="box" style="display: inline-block;float: right;">
			<c:forEach items="${requestScope.list}" var="l" varStatus="ls">
				<div class="unitbox">
					<input type="checkbox" class="chk" val="${l.id}" onclick="check(this);">
					<label><a onclick="showstumessage('${l.id}')">${l.name}</a></label>
				</div>
			</c:forEach>
	</div>
    <script type="text/javascript">
    check=function(o){
    	if($(o).attr("checked")){
    		$(o).removeAttr("checked")
    	}else{
    		$(o).attr("checked","checked");
    	}
    }
    </script>
	<script type="text/javascript">
	showstumessage=function(id){
		parent.layer_show("用户信息","activity/usershow?id="+id,800,370);
	}
		deleteall=function () {

			var ids=new Array();
			var idsn=new Array();
			var aid=${requestScope.aid};
			$(".chk").each(function(){
				if ($(this).attr('checked')){
					idsn.push($(this).attr("val"));
				}else{
					ids.push($(this).attr("val"));
				}
			});
			if(idsn.length>0){
			var r=confirm("delt it?");
			if (r==true)
			  {
			 $.ajax({
				url : "activity/delids_json",
				type : "post",
				data : {
					aid:aid,
					ids:ids+"",
				},
				dataType : "json",
				success : function(json) {
					$(".chk").each(function(){
						if($(this).attr("checked")){
							$(this).next().remove();
							$(this).remove();
						}
					});
				}
			});
			  }
			}else{
				alert("cant delt")
			}
		}
	</script>
	
</body>
</html>