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
						parent.fresh();
						layer_close();

					}
				}
			
			});
		};
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
			save();
		} 

	</script>

	<c:if test="${requestScope.infos==null}">
		<form class="f2" action="activity_summary/insert_json" method="post">
	</c:if>
	<c:if test="${requestScope.infos!=null}">
		<form class="f2" action="activity_summary/update_json" method="post">
		<input type="hidden" name="update"/>
		<input type="hidden" name="id" value="${requestScope.infos.id}" />
    </c:if>
			<div class="inputview">
			   <!--  <div class="inputspan" style="margin-top: 0px" >
					<button class="seachbt1" type="button" onclick="str();">保存</button>
				</div> -->
				<span class="inputspan">
					<label class="inputtext ">活动:</label> 
					<select name="activity_id" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.aList}"  var="r" varStatus="v">
					          <c:if test="${requestScope.infos.activity_id!=r.id}">
					                <option value="${r.id}">${r.name}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.activity_id==r.id}">
					              <option selected="selected" value="${r.id}">${r.name}</option>
					          </c:if>
				         </c:forEach>
				    </select>
				</span>
				
				<span class="inputspan">
					<label class="inputtext ">添加人:</label> 
					<select name="operator_id" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.oList}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.operator_id!=r.id}">
					               <option value="${r.id}">${r.name}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.operator_id==r.id}">
					              <option selected="selected" value="${r.id}">${r.name}</option>
					          </c:if>
				         </c:forEach>
				    </select>
				</span>
				
				<%-- <span class="inputspan">
					<label class="inputtext ">创建日期:</label> 
					<input class="laydate-icon  span1-1 inputinput" id="Calendar2" name="createdate" value="${requestScope.infos.createdate}"/>
				</span>  --%>
				
				<span class="inputspan">
					<label class="inputtext">调查情况:</label> 
					<input class="inputinput opt" type="hidden" id="name2" name="options" value="${requestScope.infos.options}"/>
				</span>
				<c:forEach items="${requestScope.questions}" var="r" varStatus="v">
				
				<span class="inputspan">
				<input type="hidden" name="answer" value="${v.index}"/>
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
					               <c:if test="${requestScope.opt[v.index]!=vv.index}">
					                    <input type="radio"  name="rad+${v.index}" class="ounit" value="${vv.index}"  >
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
					                   <c:if test="${requestScope.opt[v.index]!=vv.index}">
					                        <input type="radio" name="rads" class="ounit" value="${vv.index}" >
					                          ${rr}
					                   </c:if>
					         </c:forEach>
					    </c:if>   
				</span> 
				
				<br>
				</c:forEach>
				
				
				<span class="inputspan ufdy up">
					<label class="inputtext">学生状况:</label> 
					<select name="sstatus" class="s1" lay-filter="aihao">
				        <c:forEach items="${requestScope.scxstatus}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.sstatus!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.sstatus==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan ufdy up">
					<label class="inputtext">市场状况:</label> 
					<select name="cstatus" class="s1" lay-filter="aihao">
				        <c:forEach items="${requestScope.scxstatus}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.cstatus!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.cstatus==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan ufdy up">
					<label class="inputtext">课程状况:</label> 
					<select name="tstatus" class="s1" lay-filter="aihao">
				        <c:forEach items="${requestScope.tstatus}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.tstatus!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.tstatus==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan ufdy up">
					<label class="inputtext">学校状况:</label> 
					<select name="xstatus" class="s1" lay-filter="aihao">
				        <c:forEach items="${requestScope.scxstatus}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.xstatus!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.xstatus==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				<span class="inputspan">
					<label class="inputtext summary">总结:</label> 
					<textarea rows="10" cols="50" name="summary">${requestScope.infos.summary}</textarea>
				</span> 
				<br>
				<br>
				<br>
				<br>
				
				
				<span class="inputspan ">
					<label class="inputtext proposal">建议:</label> 
					<textarea rows="10" cols="50" name="proposal">${requestScope.infos.proposal}</textarea>
				</span> 
				<br>
				<br>
				<span class="inputspan xx" >
					<label class="inputtext">备注:</label> 
					<input class="inputinput" id="name2" name="comments" value="${requestScope.infos.comments}"/>
				</span>
				<br>
				
				<div class="inputspan" style="margin-top: 0px" >
					<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
					<button class="seachbt1" type="button" onclick="str();">保存</button>
				</div>
				
				</div>
</form>
	
  <c:import url="/Model/form_footer.jsp" ></c:import>