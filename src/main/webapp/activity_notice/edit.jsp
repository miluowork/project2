<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="../Uediter/ueditor.config.js"></script>
<script type="text/javascript" src="../Uediter/ueditor.all.min.js"> </script>
<script type="text/javascript" src="../Uediter/lang/zh-cn/zh-cn.js"></script>

<c:import url="/Model/form_head.jsp" ></c:import>
  <style>
  

body {
	font: 18px "宋体";
	text-align: center;
}

.viewlist input{
	height: 30px;
	border: #bbb solid 1px;
}
.viewlist select{
	height: 30px;
	border: #bbb solid 1px;
}
.viewlist label{
	height: 30px;
}

a:link {
	color: #00F;
	text-decoration: none;
}

a:visited {
	color: #00F;
	text-decoration: none;
}

a:hover {
	color: #c00;
	text-decoration: underline;
}

ul {
	list-style: none;
}

.main {
	clear: both;
	padding: 8px;
	text-align: center;
}



.menu0 {
	width: 600px;
}

.menu0 li {
	display: block;
	float: left;
	padding: 4px 0;
	height:30px;
	line-height:30px;
	width: 150px;
	text-align: center;
	cursor: pointer;
	background: #FFFFff;
}

.menu0 li.hover {
	background: #54f2e4;
}
.viewlist input{
	height: 30px;
}
.viewlist select{
	height: 30px;
}
.viewlist label{
	height: 30px;
}

#main0 ul {
	display: none;
}

#main0 ul.block {
	display: block;
}


  
   .inputspan1{
     margin-left: 50px
   }
   .inputspan{
     margin-left: 70px
   }
 </style>

</head>

<body style="min-width:100px;">



	<script  type="text/javascript">

	var ue = UE.getEditor('container');
	ue.ready(function(){
		ue.setContent("${requestScope.info.info}");
		
	});

	
		
		function edit() {
			
			
			var data = $(".f1").serializeArray();
			$.ajax({
				url : $(".f1").attr("action"),
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
			
					if (json.status > 0) {
						parent.fresh();
						layer_close();

					}
				}
			});
		}

		function pageParam(obj) {

		}
	</script>
   
   <script>
	function setTab(m, n) {

		var tli = document.getElementById("menu" + m)
				.getElementsByTagName("li");

		var mli = document.getElementById("main" + m)
				.getElementsByTagName("ul");

		for (i = 0; i < tli.length; i++) {

			tli[i].className = i == n ? "hover" : "";

			mli[i].style.display = i == n ? "block" : "none";

		}

	}
</script>
 
 
   
	<c:if test="${requestScope.info==null}">

		<form class="f1" method="post" action="activity_notice/insert_json" >
			</c:if>
	<c:if test="${requestScope.info!=null}">
	
     	<form class="f1" method="post" action="activity_notice/update_json" >
     	
     	 <input type="hidden"name="id" value="${requestScope.info.id}" />
			</c:if>
		
		
		
		
	
				<ul style="margin-left: 190px" class="menu0" id="menu0">
					<li onclick="setTab(0,0)" class="hover">公告详情</li>
					<li onclick="setTab(0,1)">基本信息</li>
					
				</ul>
				
				<div class="main" id="main0">
				
				
						
				<ul class="block"> 
					<li><div class="inputview1">
						
									
						<span style="margin-left: 0px" class="inputspan">
				<label class="inputtext ">详情:
						</label> 
						
							
			<div class="formControls col-xs-8 col-sm-9"> 
			
			<!-- 加载编辑器的容器 -->
   <script id="container" name="info" type="text/plain" style="width:600px;height:500px;">
      </script>
			
		</div>
						
						 
						</span>
		
						
						</div>
					</li>
				</ul>
				
				
					<ul class="block">
						<li>
						<div class="inputview1">
					
						<span style="margin-left: -40px" class="inputspan">
				<label class="inputtext ">活动:
						</label> 
						
						<select class="searchinput inputselect_long select" name="activity_id" style="appearance: none; width: 152px;height: 30px" >
						<c:forEach items="${requestScope.alist}" var="r" >
						 
						<c:if test="${requestScope.info.activity_id!=r.id}">
                       <option value="${r.id}">${r.name}</option>
                       </c:if>
                       <c:if test="${requestScope.activity_id!=r.id}">
                       <option value="${r.id}">${r.name}</option>
                       </c:if>
                       
                   <c:if test="${requestScope.info.activity_id==r.id}">
                  <option selected="selected" value="${r.id}">${r.name}</option>
                     </c:if>
                      <c:if test="${requestScope.activity_id==r.id}">
                  <option selected="selected" value="${r.id}">${r.name}</option>
                     </c:if>
						
						</c:forEach>
						
						</select>
						 
						</span>
						
						<br>
							<br>
						<span style="margin-left: -40px" class="inputspan">
				<label class="inputtext ">添加人:
						</label> 
						
						<select class="searchinput inputselect_long select" name="operator_id" style="appearance: none; width: 152px;height: 30px" >
						<c:forEach items="${requestScope.olist}" var="r" >
						 
						<c:if test="${requestScope.info.operator_id!=r.id}">
                       <option value="${r.id}">${r.name}</option>
                       </c:if>
                       
                   <c:if test="${requestScope.info.operator_id==r.id}">
                  <option selected="selected" value="${r.id}">${r.name}</option>
                     </c:if>
						
						</c:forEach>
						
						</select>
						 
						</span>
						
						
						<br>
							<br>
    <span style="margin-left: -40px" class="inputspan">
				<label class="inputtext ">标题:
						</label> 
						
								 <input
								class="inputinput" id="title" name="title"
								value="${requestScope.info.title}" style="width: 150px"
								 />
						
						 
						</span>
						
						<br>
							<br>
						  <span style="margin-left: -40px" class="inputspan">
				<label class="inputtext ">时间:
						</label> 
						
								  <input class="laydate-icon  span1-1 inputinput" style="width: 150px" id="Calendar1" name="date" value="${requestScope.info.date}" /> 
						
						 
						</span>
						
						
						
						
						<br>
							<br>
						
							<span style="margin-left: -40px" class="inputspan">
				<label class="inputtext ">状态:
						</label> 
						
						<select class="searchinput inputselect_long select" name="status" style="appearance: none; width: 152px;height: 30px" >
						<c:forEach items="${requestScope.statuses}" var="r" varStatus="v" >
						 
						<c:if test="${requestScope.info.status!=v.index}">
                       <option value="${v.index}">${r}</option>
                       </c:if>
                       
                   <c:if test="${requestScope.info.status==v.index}">
                  <option selected="selected" value="${v.index}">${r}</option>
                     </c:if>
						
						</c:forEach>
						
						</select>
						 
						</span>
						
						<br>
							<br>
									<br>
											<br>
							</div>
					</li>
					</ul>
					
					
			
			
			
			</div>
		<div class="inputbtpanel" style="margin-top: -40px">
				<button class="seachbt1"  onclick="layer_close();">取消</button>
				<button class="seachbt1" type="button" onclick="edit();">保存</button>
		</div>
	</form>
		

  <c:import url="/Model/form_footer.jsp" ></c:import>
  </body>