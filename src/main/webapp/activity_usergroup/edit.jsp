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

margin-top: 50px !important;
margin-left: 400px !important
}
label {
	font-size:15px;
	font-weight:bold;
}
</style>
<script type="text/javascript">
function personAdd(ids){
	var id=$(".s1").val();
	layer_show("编辑","activity_usergroup/personAdd?activity_id="+id+"&ids="+ids,350,260);
} 
function getIds(str,str1){
	$("input[name=ids]").val(str);
	$("input[name=idsName]").val(str1);
};

$(document).on("change",".act",function(){
	  $("input[name=ids]").val("");
	  $("input[name=idsName]").val("");
});
</script>
</head>

<body style="min-width:100px;font-size:15px;font-weight:bold">
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
		}

		function pageParam(obj) {

		}
	</script>

	<c:if test="${requestScope.infos==null}">
		<form class="f2" action="activity_usergroup/insert_json" method="post">
	</c:if>
	<c:if test="${requestScope.infos!=null}">
		<form class="f2" action="activity_usergroup/update_json" method="post">
		<input type="hidden" name="update"/>
		<input type="hidden" name="id" value="${requestScope.infos.id}" />
		<input class="inputinput" type="hidden" name="point1" value="${requestScope.infos.point1}"/>
		
			  <input class="inputinput" type="hidden" name="point2" value="${requestScope.infos.point2}"/>
			  <input class="inputinput" type="hidden" name="point3" value="${requestScope.infos.point3}"/>
			  <input class="inputinput" type="hidden" name="point4" value="${requestScope.infos.point4}"/>
			  <input class="inputinput" type="hidden" name="point5" value="${requestScope.infos.point5}"/>
			  <input class="inputinput" type="hidden" name="point6" value="${requestScope.infos.point6}"/>
			  <input class="inputinput" type="hidden" name="point7" value="${requestScope.infos.point7}"/>
			  <input class="inputinput" type="hidden" name="point8" value="${requestScope.infos.point8}"/>	
			  <input class="inputinput" type="hidden" name="point9" value="${requestScope.infos.point9}"/>
			  <input class="inputinput" type="hidden" name="point10" value="${requestScope.infos.point10}"/>
			  <input class="inputinput" type="hidden" name="createdate" value="${requestScope.infos.createdate}"/>
			  <input class="inputinput" type="hidden" name="operator_id" value="${requestScope.infos.operator_id}"/>
    </c:if>
		<div class="inputview">
			
			
				<span class="inputspan">
				
				    <c:if test="${requestScope.infos==null}">
							<label class="inputtext">活动:</label> 
							<select style="width:200px;font-size:15px;font-weight:bold" name="activity_id" class="s1 act searchinput inputselect_long" lay-filter="aihao">
						        <c:forEach items="${requestScope.aList}"  var="r" varStatus="v">
							            <c:if test="${r.type==2}"> 
							                <option style="font-size:15px;font-weight:bold"  value="${r.id}">${r.name}</option>
						                </c:if> 
						        </c:forEach>
						    </select>
				    </c:if>
				    
				    <c:if test="${requestScope.infos!=null}">
				       <label class="inputtext">活动:</label>
					   <c:forEach items="${requestScope.aList}"  var="r" varStatus="v">
					       <c:if test="${requestScope.infos.activity_id==r.id}">
					              <input class="inputinput s1" type="hidden" id="name" name="activity_id" value="${r.id}"/>
					              <input style="width:200px;font-size:15px;font-weight:bold" class="inputinput"  disabled="disabled" id="name" name="Activity_Name" value="${r.name}"/>
				           </c:if>
				       </c:forEach>
				    </c:if>
				    
					<label style="margin-left: 100px" class="inputtext ">项目:</label> 
					<input style="width:200px;font-size:15px;font-weight:bold" class="inputinput" id="name" name="project" value="${requestScope.infos.project}"/>
				    
				</span>
			
		    	<span class="inputspan">
					<label class="inputtext ">组名:</label> 
					<input style="width:200px;font-size:15px;font-weight:bold" class="inputinput" id="name" name="groupname" value="${requestScope.infos.groupname}"/>
				
				    <label style="margin-left: 100px" class="inputtext">组成员:</label> 
					<input type="hidden" class="inputinput" id="name" name="ids" value="${requestScope.infos.ids}"/>
					<input style="width:200px;font-size:15px;font-weight:bold" class="inputinput" disabled="disabled" id="name" name="idsName" value="${requestScope.ids}"/>
					<input class="seachbt1 btn"  type="button" onclick="personAdd(${requestScope.infos.ids});" style="width:50px !important;"  value="分组" id="name" />
				</span>
				
				<span class="inputspan">
				    <label  class="inputtext ">路径:</label> 
					<input style="width:200px;font-size:15px;font-weight:bold" class="inputinput" id="name" name="path" value="${requestScope.infos.path}"/>
				    
				    <label style="margin-left: 100px"  class="inputtext ">备注:</label> 
					<input style="width:200px;font-size:15px;font-weight:bold" class="inputinput" id="name2" name="comments" value="${requestScope.infos.comments}"/>
				</span>
				
				<div class="inputspan btns" >
					<button style="height: 35px" class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button style="height: 35px" class="seachbt1" type="button" onclick="save();">保存</button>
				</div>
				</div>
</form>
	
  <c:import url="/Model/form_footer.jsp" ></c:import>