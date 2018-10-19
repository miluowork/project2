<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="../Uediter/ueditor.config.js"></script>
<script type="text/javascript" src="../Uediter/ueditor.all.min.js"> </script>
<script type="text/javascript" src="../Uediter/lang/zh-cn/zh-cn.js"></script>

<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="../css/timePicker.css">
<script type="text/javascript" src="../js/jquery-timepicker.js"/></script>



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
	width: 160px;
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


<script type="text/javascript">
	var str = ""; 
	document.writeln("<div id=\"_contents\" style=\"padding:5px;background-color:#ECF7FE;font-size:12px;border:1px solid #CFD1D5;position:absolute;left:?px; top:?px; width:?px; height:?px;z-index:1;visibility:hidden\">"); 
	str += "时<select id=\"_hour\">"; 
 
	for (h = 0; h <= 23; h++) { 
		if(h >=0 && h<=9)
		   str += "<option value=\"0" + h + "\">0" + h + "</option>";
		else
		   str += "<option value=\"" + h + "\">" + h + "</option>"; 
	}
 
	str += "</select> 分<select id=\"_minute\">"; 
	for (m = 0; m <= 59; m++) { 
		if(m >=0 && m<=9)
		   str += "<option value=\"0" + m + "\">0" + m + "</option>";
		else
		   str += "<option value=\"" + m + "\">" + m + "</option>"; 
		  
	}
 
	
 
	str += "</select> <input type=\"button\" onclick=\"_select()\" value=\"\确定\" /> <input type=\"button\" onclick=\"_clear()\" value=\"\清除\" /></div>"; 
	document.writeln(str);
 
	var _fieldname; 
 
	function _SetTime(tt) { 
		_fieldname = tt; 
		var ttop = tt.offsetTop;    //TT控件的定位点高 
		var thei = tt.clientHeight;    //TT控件本身的高 
		var tleft = tt.offsetLeft;    //TT控件的定位点宽 
		while (tt = tt.offsetParent) { 
			ttop += tt.offsetTop; 
			tleft += tt.offsetLeft; 
		} 
		document.all._contents.style.top = ttop + thei + 4; 
		document.all._contents.style.left = tleft; 
		document.all._contents.style.visibility = "visible"; 
	} 
 
	function _select() { 
		_fieldname.value = document.all._hour.value+":"+ document.all._minute.value; 
		document.all._contents.style.visibility = "hidden"; 
	}
	
	function _clear() { 
		document.all._hour.value = document.all._minute.value = "00";
		_fieldname.value = "";
		document.all._contents.style.visibility = "hidden";
	}
 
	document.onclick = function(e){
		e = window.event||e;
		obj = e.srcElement ? e.srcElement : e.target;
		if(obj.className != "time" && obj.id != "_contents" && obj.id != "_hour" && obj.id != "_minute" && obj.id != "_second"){
			document.all._contents.style.visibility = "hidden";
		}
	};
</script>


	<script  type="text/javascript">

	$("#beginTime").hunterTimePicker();
    $("#endTime").hunterTimePicker();

		
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

		<form class="f1" method="post" action="activity_time/insert_json" >
			</c:if>
	<c:if test="${requestScope.info!=null}">
	
     	<form class="f1" method="post" action="activity_time/update_json" >
     	
     	 <input type="hidden"name="id" value="${requestScope.info.id}" />
			</c:if>
		
		
		
		
	
				<ul style="margin-left: 170px" class="menu0" id="menu0">
					<li onclick="setTab(0,0)" class="hover">基本信息</li>
					<li onclick="setTab(0,1)">时间安排</li>
					
					
				</ul>
				
				<div class="main" id="main0">
				
				
				
				
					<ul class="block">
						<li>
						<div class="inputview1">
					
						<span style="margin-left: 0px;float: left;" class="inputspan">
				<label class="inputtext ">活动:
						</label> 
						
						<select class="searchinput inputselect_long select" name="activity_id" style="appearance: none; width: 200px;height: 30px" >
						<c:forEach items="${requestScope.alist}" var="r" >
						 
						<c:if test="${requestScope.info.activity_id!=r.id}">
                       <option value="${r.id}">${r.name}</option>
                       </c:if>
                       
                   <c:if test="${requestScope.info.activity_id==r.id}">
                  <option selected="selected" value="${r.id}">${r.name}</option>
                     </c:if>
						
						</c:forEach>
						
						</select>
						 
						</span>
						
						<span style="margin-left: -80px" class="inputspan">
				<label class="inputtext ">日期:
						</label> 
						 <input class="laydate-icon  span1-1 inputinput" style="width: 200px" id="Calendar1" name="date" value="${requestScope.info.date}" /> 
						 
						</span>
						
						
					
    <span style="margin-left: 0px;float: left;" class="inputspan">
				<label class="inputtext ">讲师:
						</label> 
				
						 	<select class="searchinput inputselect_long select" name="operator_id" style="appearance: none; width: 200px;height: 30px" >
						<c:forEach items="${requestScope.operator}" var="r" varStatus="v" >
						 
						<c:if test="${requestScope.info.operator_id!=r.id}">
                       <option value="${r.id}">${r.name}</option>
                       </c:if>
                       
                   <c:if test="${requestScope.info.operator_id==r.id}">
                  <option selected="selected" value="${r.id}">${r.name}</option>
                     </c:if>
						
						</c:forEach>
						
						</select>
						</span>
						
						
								   <span style="margin-left: -80px" class="inputspan">
				<label class="inputtext ">状态:
						</label> 
						
						<select class="searchinput inputselect_long select" name="status" style="appearance: none; width: 200px;height: 30px" >
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
						
						
               <span style="margin-left: -20px" class="inputspan">
				<label class="inputtext ">地点详情:
						</label> 
			
						 	<textarea class="inputarea1"  name="roominfo" style="width: 490px;height: 80px;resize:none;overflow-x:hidden;" >
					${requestScope.info.roominfo}
						 </textarea>
				
						</span>
						
					
									<br>	
									<br>	
							        <br>
									<br>	
									
							 <span style="margin-left: -20px" class="inputspan">
				       <label class="inputtext ">备注:
						</label> 
			
					 	<textarea class="inputarea1" name="comments" style="width: 490px;height: 84px;resize:none;overflow-x:hidden;" >
						 ${requestScope.info.comments}
						 </textarea>			
				
						
							</span>
							
								<div class="inputbtpanel" style="margin-top:60px">
				<button class="seachbt1"  onclick="layer_close();">取消</button>
				<button class="seachbt1" type="button" onclick="edit();">保存</button>
		</div>
						
						
							</div>
					</li>
					</ul>
					
					
						
				<ul > 
					<li><div class="inputview1">
						
									
						<span style="margin-left: 0px" class="inputspan">
				
						
			 <div class="row">      
			   <div style="float: left;margin-left: 180px" class="form-group"> 
			              <label class="col-sm-1 control-label" for="" id="">上午开始时间</label>            
			              <div class="col-sm-5">                
			           <input class="time" name="time1" value="${requestScope.info.time1}"  type="text" size="8" readonly onclick="_SetTime(this)"/> 
			                            <font color="red" id="validateBeginTime"></font>    
			                                    </div> 
			                                           </div>     
			                                           
			                                           
			                                           <div style="float:left;margin-left: 60px" class="form-group"> 
			                    <label class="col-sm-1 control-label" for="" id="">上午结束时间</label> 
			                               <div class="col-sm-5">  
			        <input class="time" name="time2" type="text" size="8" value="${requestScope.info.time2}" readonly onclick="_SetTime(this)"/> 
			           <font color="red" id="validateEndTime"></font>           
			            </div>       
			             </div> 
			                                       </div>               
			        
			 
						</span>
						
						<br>
						<br>		
						<br>			
									
						<span style="margin-left: 0px" class="inputspan">
				
						
			 <div class="row">      
			   <div style="float: left;margin-left: 180px" class="form-group"> 
			              <label class="col-sm-1 control-label" for="" id="">下午开始时间</label>            
			              <div class="col-sm-5">                
			           <input class="time" name="time3" value="${requestScope.info.time3}"  type="text" size="8" readonly onclick="_SetTime(this)"/> 
			                            <font color="red" id="validateBeginTime"></font>    
			                                    </div> 
			                                           </div>     
			                                           
			                                           
			                                   <div style="float:left;margin-left: 60px" class="form-group"> 
			                    <label class="col-sm-1 control-label" for="" id="">下午结束时间</label> 
			                               <div class="col-sm-5">  
			        <input class="time" name="time4" type="text" size="8" value="${requestScope.info.time4}" readonly onclick="_SetTime(this)"/> 
			           <font color="red" id="validateEndTime"></font>           
			            </div>       
			             </div> 
			                                       </div>               
			        
			 
						</span>
						
						<br>
						<br>		
						<br>				
											
						<span style="margin-left: 0px" class="inputspan">
				
						
			 <div class="row">      
			   <div style="float: left;margin-left: 180px" class="form-group"> 
			              <label class="col-sm-1 control-label" for="" id="">晚上开始时间</label>            
			              <div class="col-sm-5">                
			           <input class="time" name="time5" value="${requestScope.info.time5}"  type="text" size="8" readonly onclick="_SetTime(this)"/> 
			                            <font color="red" id="validateBeginTime"></font>    
			                                    </div> 
			                                           </div>     
			                                           
			                                           
			                                      <div style="float:left;margin-left: 60px" class="form-group"> 
			                    <label class="col-sm-1 control-label" for="" id="">晚上结束时间</label> 
			                               <div class="col-sm-5">  
			        <input class="time" name="time6" type="text" size="8" value="${requestScope.info.time6}" readonly onclick="_SetTime(this)"/> 
			           <font color="red" id="validateEndTime"></font>           
			            </div>       
			             </div> 
			                                       </div>               
			        
			 
						</span>
						
		
					
						
						</div>
					</li>
					
					
					
							<div class="inputbtpanel" style="margin-top: -40px;margin-top: 40px">
				<button class="seachbt1"  onclick="layer_close();">取消</button>
				<button class="seachbt1" type="button" onclick="edit();">保存</button>
		</div>
				</ul>
				
		
				
			
				
				
			
			
			
			</div>
		
	</form>
		

  <c:import url="/Model/form_footer.jsp" ></c:import>
  </body>