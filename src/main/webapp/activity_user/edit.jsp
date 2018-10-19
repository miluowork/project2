<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
<script type="text/javascript">
function changer(o){
	$(o).nextAll().remove();
	 $.getJSON("activity_user/getCollegeList",{school_id:o.value},function(json){//地址，值，function(后台传过来的集合，转为json数组)
		console.log(json);
		if(json.length>0){
			var lab=$("<label style='margin-left:8px;' class='inputtext'>学院:</label>"); 
			var select=$("<select class='sele searchinput' name='college_id'></select>");
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
<style>
.inputinput,.searchinput {
	width:260px;
}
/* .sch{
	text-align: center!important;
}  */ 
select{  
    position:relative;
    z-index:1 !important;
    appearance:none !important;
    -moz-appearance:none !important; /* Firefox */
    -webkit-appearance:none !important; /* Safari 和 Chrome */
    }
.dispear{
    width: 30px;
    height: 20px;
    background: #FFF;
    position: relative;
    z-index: 4;
    left: 35px;
    top: -20px;
}
.btns{
margin-left: 240px;
margin-top: 50px;
}
</style>
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
				url : "activity_user/insert_json?activityid=${requestScope.activityid}",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				/* event.srcElement.disabled=false; */
					if (json.status > 0) {
						 parent.fresh();
						layer_close();

					}
				}
			});
		}
		function edit() {
			if (name2.value == "") {
				MsgDialog("必须录入名称！", "录入错误");
				return;
			}
			/* event.srcElement.disabled=true; */
			var data = $(".f2").serializeArray();
			$.ajax({
				url : "activity_user/update_json",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				/* event.srcElement.disabled=false; */
					if (json.status > 0) {
						/* window.location.reload(); */
						/* window.parent.location.reload(); */
						parent.fresh();
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
			<div class="inputview">
			    <input type="hidden" name="insert"/>
				
				<span class="inputspan">
				    <label class="inputtext ">姓名:</label> 
					<input class="inputinput" id="name1" name="name" />
					
					<label class="inputtext ">性别:</label> 
				    <c:forEach items="${requestScope.sex}"  var="r" varStatus="v">
				        <input style="width:80px" type="radio" name="sex" value="${v.index}" />${r}
				    </c:forEach>
				</span>
				
				<input hidden="hidden" name="activity_id" value="0">
				<input type="hidden" class="inputinput" id="name2" name="type" value="1"/>
				<input type="hidden" class="inputinput" id="name2" name="ylevel" value="0"/>
				<input type="hidden" class="inputinput" id="name2" name="glevel" value="0"/>
				<input type="hidden" class="inputinput" id="name2" name="slevel" value="0"/>
				<input type="hidden" class="inputinput" id="name2" name="classinfo" value="无"/>
				
				
				<span class="inputspan">
				    <label class="inputtext ">电话:</label> 
					<input class="inputinput" id="name1" name="tel" />
					<label class="inputtext ">QQ:</label> 
					<input class="inputinput" id="name2" name="qq""/>
				</span>
				
				<span class="inputspan">
					<label class="inputtext ">个人详情:</label> 
					<input class="inputinput" id="name1" name="info" />
					
					<label class="inputtext">状态:</label> 
					<select name="type" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.status}"  var="r" varStatus="v">
					               <option value="${v.index}">${r}</option>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan">
					<label class="inputtext ">学校:</label> 
					<select onclick="changer(this)" name="school_id" class="s1  searchinput inputselect_long" >
				        <c:forEach items="${requestScope.sList}"  var="r" varStatus="v">
					               <option value="${r.id}" class="sch">${r.name}</option>
				    </c:forEach>
				   </select>
				   
				   <label class='inputtext'>学院:</label> 
				   <select  class='sele sch searchinput inputselect_long' name="college_id">
				   <c:forEach items="${requestScope.cList}"  var="row" varStatus="v">
				      <c:if test="${row.school_id==1}">
					     <option value="${row.id}" class="sch">${row.name}</option>
					  </c:if>
				    </c:forEach>
				   </select>
				   
				</span>
				
				
				<div class="inputspan btns" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="add();">保存</button>
				</div>
				</div>
		</form>
	</c:if>
	
	
	<!--修改 -->
	
	
	<c:if test="${requestScope.infos!=null}">

		<form class="f2">
			<div class="inputview">
			    <input type="hidden" name="update"/>
				<input type="hidden" name="id" value="${requestScope.infos.id}" />
				<span class="inputspan">
					<label class="inputtext ">昵称:</label> 
					<input class="inputinput" id="name2" name="niki" value="${requestScope.infos.niki}"/>
				   
				    <label class="inputtext ">姓名:</label> 
					<input class="inputinput" id="name2" name="name" value="${requestScope.infos.name}"/>
				</span>
				
				<span class="inputspan">
				<label class="inputtext ">电话:</label> 
					<input class="inputinput" id="name2" name="tel" value="${requestScope.infos.tel}"/>
					<label class="inputtext ">性别:</label> 
				        <c:forEach items="${requestScope.sex}"  var="r" varStatus="v">
					          <c:if test="${requestScope.infos.sex!=v.index}">
					               <input style="width:80px" type="radio" name="sex" value="${v.index}" />${r}
					          </c:if>
					          <c:if test="${requestScope.infos.sex==v.index}">
					               <input checked="checked" style="width:80px" type="radio" name="sex" value="${v.index}" />${r}
					          </c:if>
				         </c:forEach>
				         
				     
				</span>
				
				<input hidden="hidden" name="activity_id" value="0">
				<input type="hidden" class="inputinput" id="name2" name="type" value="1"/>
				<input type="hidden" class="inputinput" id="name2" name="ylevel" value="0"/>
				<input type="hidden" class="inputinput" id="name2" name="glevel" value="0"/>
				<input type="hidden" class="inputinput" id="name2" name="slevel" value="0"/>
				<input type="hidden" class="inputinput" id="name2" name="classinfo" value="无"/>
				
				
				
				<span class="inputspan">
					<label class="inputtext ">QQ:</label> 
					<input class="inputinput" id="name2" name="qq" value="${requestScope.infos.qq}"/>
				    
				    <label class="inputtext ">个人详情:</label> 
					<input class="inputinput" id="name2" name="info" value="${requestScope.infos.info}"/>
				</span>
				
				
				<span class="inputspan">
					<label style="width:80px;" class="inputtext sch">学校:</label> 
					<select onclick="changer(this)" name="school_id" class="s1 sch searchinput inputselect_long" >
				        <c:forEach items="${requestScope.sList}"  var="r" varStatus="v">
					          <c:if test="${requestScope.infos.school_id!=r.id}">
					               <option value="${r.id}">${r.name}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.school_id==r.id}">
					               <option selected="selected" value="${r.id}">${r.name}</option>
					          </c:if>
				    </c:forEach>
				   </select>
				   
				   <label style="width:80px;" class='inputtext sch'>学院:</label> 
				   <select class='sele sch searchinput inputselect_long' name="college_id">
				   <c:forEach items="${requestScope.clist}"  var="row" varStatus="v">
					          <c:if test="${requestScope.infos.college_id!=row.id}">
					               <option value="${row.id}">${row.name}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.college_id==row.id}">
					               <option selected="selected" value="${row.id}">${row.name}</option>
					          </c:if>
				    </c:forEach>
				   </select>
				   
				</span>
				
				
				
				<span class="inputspan">
					<label class="inputtext ">状态:</label> 
					<select name="status" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.status}"  var="r" varStatus="v">
					          <c:if test="${requestScope.infos.status!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.status==v.index}">
					               <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				
				<div class="inputspan btns" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();">保存</button>
				</div>
				</div>
		</form>
	</c:if>
  <c:import url="/Model/form_footer.jsp" ></c:import>