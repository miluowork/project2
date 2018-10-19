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
margin-top: 30px !important;
margin-left:100px !important;
}

tbody,th,tr{
border: 1px solid black;
}

th{
padding: 0!important;
}

.input2{
width:32px !important;
height:36px;
border: 0px;
outline:none;
cursor: pointer;
font-size:15px;
font-weight: bold;
}

table{
table-layout:fixed;
margin-top:20px;
margin-left:10px;
width:400px;
height:180px;
overflow: hidden;
}

.group{
font-size: 15px !important;
font-weight: lighter;
}

label {
	margin-left:10px;font-size:15px;
}
/* input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button { 
   -webkit-appearance: none;
} 
input[type="number"] {
    -moz-appearance: textfield;
} */

</style>
</head>

<body style="min-width:100px;">
	<script>
		function save() {
			if (name.value == "") {
				MsgDialog("必须录入名称！", "录入错误");
				return;
			}
			var data = $(".f2").serializeArray();
			$.ajax({
				url : $(".f2").attr("action"),
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
					if (json.status > 0) {
						/* parent.fresh(); */
						layer_close();
					}
				}
			});
		};
		
		function inputValue(){
			 $(".input2").each(function(i){
				var input2=$(".input2").eq(i).val();
				if(!isNaN(input2)){
					/* alert("是个整数");*/
					$(".input2").eq(i).prev().val(input2);
				}else{
					/* alert("不是个整数"); */
					$(".input2").eq(i).prev().val(0);
				}
				/* alert(i+" input2: "+ input2); */
				/* alert(i+" input1: "+ $(".input2").eq(i).prev().val()); */
			});
			save();
		};
		$(document).ready(function(){
			var type=${requestScope.type};
			if(type>2){
				$("input").css("display","none").attr("disabled","disabled");
				$(".btns").css("display","none").attr("disabled","disabled");
			}else{
				
			}
		})
	</script>

	<form class="f2" action="activity_usergroup/update_json" method="post">
		<input type="hidden" name="update"/>
		<input type="hidden" name="id" value="${requestScope.infos.id}" />
				
				
				    <input class="inputinput" type="hidden" name="activity_id" value="${requestScope.infos.activity_id}"/>
					<input class="inputinput" type="hidden" name="ids" value="${requestScope.infos.ids}"/>
					<input class="inputinput" type="hidden" name="project" value="${requestScope.infos.project}"/>
				    <input class="inputinput" type="hidden" name="createdate" value="${requestScope.infos.createdate}"/>
					<input class="inputinput" type="hidden" name="operator_id" value="${requestScope.infos.operator_id}"/>
				    <input class="inputinput" type="hidden" name="comments" value="${requestScope.infos.comments}"/>
				    <input class="inputinput" type="hidden" name="path" value="${requestScope.infos.path}"/>
				    <input class="inputinput" type="hidden" name="groupname" value="${requestScope.infos.groupname}"/>
	   <div class="inputview">
				<c:if test="${requestScope.a!=null}">
				<div class="group" style="font-size:20px;font-weight: bold;">
					<label>项目：</label>
					<label>${requestScope.infos.project}</label>
				</div>
				
				<div class="group" style="font-size: 20px;font-weight: bold;">
					<label>小组：</label>
					<label>${requestScope.infos.groupname}</label>
				</div>
				
				<div class="group" style="font-size: 20px;font-weight: bold;">
					<label>成员：</label>
					<label>${requestScope.infos.members}</label>
				</div>
				</c:if>
				
				<c:if test="${requestScope.a==null}">
				        <div class="group" style="font-size: 20px;font-weight: bold;">
					<label>小组：</label>
					<label>${requestScope.infos.groupname}</label>
					
					<label style="margin-left: 150px">项目：</label>
					<label>${requestScope.infos.project}</label>
				</div>
				
				<div class="group" style="font-size: 20px;font-weight: bold;">
					<label>成员：</label>
					<label>${requestScope.infos.members}</label>
				</div>
				
						<table>
						<thead >
						<tr>
							<th colspan="5" style="margin-left:50px;font-size: 15px;font-weight: bold;">评委评分</th>
						</tr>
						</thead>
						<tbody style="border: 1px solid black;">
						<tr style="border: 1px solid black;">
							<th>评委1</th>
							<th>评委2</th>
							<th>评委3</th>
							<th>评委4</th>
							<th>评委5</th>
						</tr>
						<tr style="border: 1px solid black;">
							<th>
							   <c:if test="${requestScope.type>=3}">
							   ${requestScope.infos.point1}
							   </c:if>
							   
							   <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
							      <c:if test="${requestScope.infos.point1==v.index}">
							         <input  class="input1" type="hidden"  value="${v.index}" name="point1" />
							         <input  type="number" max="10" min="1" class="input2" value="${r}" />  
						          </c:if>
						       </c:forEach>
						    </th>
							<th>
							   <c:if test="${requestScope.type>=3}">
							   ${requestScope.infos.point2}
							   </c:if>
							   <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
							      <c:if test="${requestScope.infos.point2==v.index}">
							         <input  class="input1" type="hidden"  value="${v.index}" name="point2" />
							         <input  type="number" max="10" min="1" class="input2" value="${r}"  />
						          </c:if>
						       </c:forEach>
						    </th>
							<th>
							
							   <c:if test="${requestScope.type>=3}">
							   ${requestScope.infos.point3}
							   </c:if>
							   <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
							      <c:if test="${requestScope.infos.point3==v.index}">
							         <input  class="input1" type="hidden"  value="${v.index}" name="point3" />
							         <input  type="number" max="10" min="1" class="input2" value="${r}" />
						          </c:if>
						       </c:forEach>
						    </th>
							<th>
							
							   <c:if test="${requestScope.type>=3}">
							   ${requestScope.infos.point4}
							   </c:if>
							   <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
							      <c:if test="${requestScope.infos.point4==v.index}">
							         <input class="input1" type="hidden"  value="${v.index}" name="point4" />
							         <input type="number" max="10" min="1" class="input2"  value="${r}" />
						          </c:if>
						       </c:forEach>
						    </th>
							
							 <th>
							 
							   <c:if test="${requestScope.type>=3}">
							   ${requestScope.infos.point5}
							   </c:if>
							   <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
							      <c:if test="${requestScope.infos.point5==v.index}">
							         <input  class="input1" type="hidden"  value="${v.index}" name="point5" />
							         <input  type="number" max="10" min="1" class="input2" value="${r}" />
						          </c:if>
						       </c:forEach>
						    </th>
							
						</tr>
						<tr style="border: 1px solid black;">
							<th>评委6</th>
							<th>评委7</th>
							<th>评委8</th>
							<th>评委9</th>
							<th>评委10</th>
						</tr>
						<tr style="border: 1px solid black;">
							<th>
							
							   <c:if test="${requestScope.type>=3}">
							   ${requestScope.infos.point6}
							   </c:if>
							   <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
							      <c:if test="${requestScope.infos.point6==v.index}">
							         <input  class="input1" type="hidden"  value="${v.index}" name="point6" />
							         <input  type="number" max="10" min="1" class="input2" value="${r}" />
						          </c:if>
						       </c:forEach>
						    </th>
							<th>
							
							   <c:if test="${requestScope.type>=3}">
							   ${requestScope.infos.point7}
							   </c:if>
							   <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
							      <c:if test="${requestScope.infos.point7==v.index}">
							         <input  class="input1" type="hidden"  value="${v.index}" name="point7" />
							         <input  type="number" max="10" min="1" class="input2" value="${r}" />
						          </c:if>
						       </c:forEach>
						    </th>
							<th>
							
							   <c:if test="${requestScope.type>=3}">
							   ${requestScope.infos.point8}
							   </c:if>
							   <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
							      <c:if test="${requestScope.infos.point8==v.index}">
							         <input  class="input1" type="hidden"  value="${v.index}" name="point8" />
							         <input  type="number" max="10" min="1" class="input2" value="${r}"  />
						          </c:if>
						       </c:forEach>
						    </th>
							<th>
							   <c:if test="${requestScope.type>=3}">
							   ${requestScope.infos.point9}
							   </c:if>
							   <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
							      <c:if test="${requestScope.infos.point9==v.index}">
							         <input  class="input1" type="hidden"  value="${v.index}" name="point9" />
							         <input  type="number" max="10" min="1" class="input2" value="${r}" />
						          </c:if>
						       </c:forEach>
						    </th>
							<th>
							   
							   <c:if test="${requestScope.type>=3}">
							   ${requestScope.infos.point10}
							   </c:if>
							   <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
							      <c:if test="${requestScope.infos.point10==v.index}">
							         <input  class="input1" type="hidden"  value="${v.index}" name="point10" />
							         <input  type="number" max="10" min="1" class="input2" value="${r}" />
						          </c:if>
						       </c:forEach>
						    </th>
						</tr>
						</tbody>
						<tfoot></tfoot>
						
						</table>
						
						<div class="inputspan btns" >
							<button style="height: 35px" class="seachbt1" type="button" onclick="layer_close();"
								>取消</button>
							<button style="height: 35px" class="seachbt1" type="button" onclick="inputValue();">保存</button>
						</div>
				</c:if>
				
	 </div>
</form>
	
  <c:import url="/Model/form_footer.jsp" ></c:import>