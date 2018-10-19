<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
<script type="text/javascript">
function changer(o){
	$(o).nextAll().remove();
	 $.getJSON("activity_user/getCollegeList",{school_id:o.value},function(json){//地址，值，function(后台传过来的集合，转为json数组)
		console.log(json);
		if(json.length>0){
			var lab=$("<label class='inputtext'>学院:</label>"); 
			var select=$("<select class='sele searchinput inputselect_long' name='college_id'></select>");
			for(var i=0;i<json.length;i++){
				select.append($("<option value='"+json[i].id+"'>"+json[i].name+"</option>"));//下拉框内追加option
			}
			$(o).after(select);//当前元素之后追加下拉框
			$(".sele").before(lab);
			
		}
	}); 
};
function tp(o){
	var type=$(o).val();
	if(type!=1){
		$(".ufdy").css("display","block");
	}
	if(type==1){
		$(".ufdy").css("display","none");
	}
};
$(document).ready(function(){
	var s=$(".upSelect").val();
	if(s==1)
	$(".up").css("display","none");
})

</script>
</head>

<body style="min-width:100px;">
	<script>
		function add() {
			if (name1.value == "") {
				MsgDialog("必须录入名称！", "录入错误");
				return;
			}
			/* event.srcElement.disabled=true; */
			var data = $(".f1").serializeArray();
			$.ajax({
				url : "activity/user_insert_json?activityid=${requestScope.activityid}",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				/* event.srcElement.disabled=false; */
					if (json.status > 0) {
						parent.sonfresh();
						layer_close();
					}
				}
			});
		}
		pageParam=function(obj) {
		}
	</script>

	<c:if test="${requestScope.infos==null}">
		<form class="f1">
			<div class="inputview" style="margin-left: calc( 50% - 500px )">
				<span class="inputspan">
					<label class="inputtext ">昵称:</label> 
					<input class="inputinput" id="name1" name="niki" />
				
					<label   class="inputtext ">姓名:</label> 
					<input class="inputinput" id="name1" name="name" />
				
					<label class="inputtext ">电话:</label> 
					<input class="inputinput" id="name1" name="tel" />
					</span>
						<span class="inputspan">
					<label   class="inputtext ">QQ:</label> 
					<input class="inputinput" id="name2" name="qq""/>
				
					<label class="inputtext ">班级详情:</label> 
					<input class="inputinput" id="name2" name="classinfo""/>
			
					<label class="inputtext "  >个人详情:</label> 
					<input class="inputinput" id="name1" name="info" />
				</span>
							<span class="inputspan">
					<label class="inputtext ">学校:</label> 
					<select onclick="changer(this)" name="school_id" class="s1  searchinput inputselect_long" >
				        <c:forEach items="${requestScope.sList}"  var="r" varStatus="v">
					               <option value="${r.id}">${r.name}</option>
				    </c:forEach>
				   </select>
				   
				   <label class='inputtext' style="margin-left: 30px">学院:</label> 
				   <select class='sele searchinput inputselect_long' name="college_id">
				   <c:forEach items="${requestScope.cList}"  var="row" varStatus="v">
				      <c:if test="${row.school_id==1}">
					     <option value="${row.id}">${row.name}</option>
					  </c:if>
				    </c:forEach>
				   </select>
				   
				</span>
				
				<span class="inputspan">
					<label class="inputtext">状态:</label> 
					<select name="type" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.status}"  var="r" varStatus="v">
					               <option value="${v.index}">${r}</option>
				         </c:forEach>
				   </select>
				</span>
				
							<span class="inputspan">
					<label class="inputtext">性别:</label> 
					<select name="sex" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.sex}"  var="r" varStatus="v">
					               <option value="${v.index}">${r}</option>
				         </c:forEach>
				   </select>
				
					<label class="inputtext " style="margin-left: 30px">类型:</label> 
					<select onclick="tp(this)" name="type" class="s1 type  searchinput inputselect_long" >
				        <c:forEach items="${requestScope.type}"  var="r" varStatus="v" step="2">
					               <option value="${v.index}">${r}</option>
				         </c:forEach>
				   </select>
			
				<input hidden="hidden" name="activity_id" value="${requestScope.activityid}">
				
					<label class="inputtext" style="margin-left: 30px">意向:</label> 
					<select name="ylevel" class="s1  searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.ylevel}"  var="r" varStatus="v">
					               <option value="${v.index}">${r}</option>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan ufdy">
					<label class="inputtext">关注等级:</label> 
					<select name="glevel" class="s1  searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.glevel}"  var="r" varStatus="v">
					               <option value="${v.index}">${r}</option>
				         </c:forEach>
				   </select>
				   
					<label class="inputtext" style="margin-left: 30px">状态等级:</label> 
					<select name="slevel" class="s1  searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.slevel}"  var="r" varStatus="v">
					               <option value="${v.index}">${r}</option>
				         </c:forEach>
				   </select>
				</span>
				
				<div class="inputspan" >
					<button style="margin-left: 390px" class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="add();">保存</button>
				</div>
				</div>
		</form>
	</c:if>
	
	
	<!--修改 -->
  <c:import url="/Model/form_footer.jsp" ></c:import>