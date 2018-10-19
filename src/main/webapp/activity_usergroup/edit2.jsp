<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/Model/form_head.jsp" ></c:import>
<style type="text/css">
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
	width: 300px;
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

</style>

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
</head>
<script type="text/javascript">
	function edit() {
		if (name1.value == "") {
			MsgDialog("必须录入名称！", "录入错误");
			return;
		}
		event.srcElement.disabled=true;
		var data = $(".f1").serializeArray();
		$.ajax({
			url : "activity_usergroup/index",
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
</script>
<body style="min-width:200px;">
		<form class="f1" >
				<ul class="menu0" id="menu0">
					<li onclick="setTab(0,0)" class="hover">分组信息</li>
					<li onclick="setTab(0,1)">评委打分</li>
				</ul>
				
				<div class="main" id="main0">
				            <c:if test="${requestScope.infos==null}">
							    <input type="hidden" name="insert" /> 
							</c:if>
							<c:if test="${requestScope.infos!=null}">
								<input type="hidden" name="update" /> 
								<input type="hidden" name="id" value="${requestScope.infos.id}"> 
							</c:if>
					<ul class="block">
						<li>
						<div class="inputview1">
					<span class="inputspan">
					<label class="inputtext ">活动:</label> 
					<select name="activity_id" class="s1 searchinput inputselect_long" style="width:142px" lay-filter="aihao">
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
					<label class="inputtext ">组成员:</label> 
					<input class="inputinput" id="name" name="ids" value="${requestScope.infos.ids}"/>
				</span>
				
				<span class="inputspan">
					<label class="inputtext ">项目:</label> 
					<input class="inputinput" id="name" name="project" value="${requestScope.infos.project}"/>
				</span>
				
				
				<span class="inputspan">
					<label class="inputtext ">备注:</label> 
					<input class="inputinput" id="name2" name="comments" value="${requestScope.infos.comments}"/>
				</span>
					</div>
					</li>
					</ul>
				<ul>
					<li><div class="inputview1">
						<span class="inputspan ufdy up">
					<label class="inputtext">评分1:</label> 
					<select name="point1" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.point1!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.point1==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan ufdy up">
					<label class="inputtext">评分2:</label> 
					<select name="point2" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.point2!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.point2==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan ufdy up">
					<label class="inputtext">评分3:</label> 
					<select name="point3" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.point3!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.point3==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan ufdy up">
					<label class="inputtext">评分4:</label> 
					<select name="point4" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.point4!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.point4==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan ufdy up">
					<label class="inputtext">评分5:</label> 
					<select name="point5" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.point5!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.point5==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan ufdy up">
					<label class="inputtext">评分6:</label> 
					<select name="point6" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.point6!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.point6==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan ufdy up">
					<label class="inputtext">评分7:</label> 
					<select name="point7" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.point7!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.point7==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan ufdy up">
					<label class="inputtext">评分8:</label> 
					<select name="point8" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.point8!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.point8==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan ufdy up">
					<label class="inputtext">评分9:</label> 
					<select name="point9" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.point9!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.point9==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
				
				<span class="inputspan ufdy up">
					<label class="inputtext">评分10:</label> 
					<select name="point10" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.points}"  var="r" varStatus="v">
					           <c:if test="${requestScope.infos.point10!=v.index}">
					               <option value="${v.index}">${r}</option>
					          </c:if>
					          <c:if test="${requestScope.infos.point10==v.index}">
					              <option selected="selected" value="${v.index}">${r}</option>
					          </c:if>
				         </c:forEach>
				   </select>
				</span>
						</div>
					</li>
				</ul>
				<ul>
					<li><div class="inputview1">
					<span class="inputspan"> 
					<label class="inputtext" >职位:</label> 
						<c:forEach var="r" items="${requestScope.courselist}">
							<label class="inputtext" >${r.name}</label>
							<c:if test="${fn:indexOf(requestScope.info.job,r.id)>=0}">
							<input type="checkbox"  name="job" checked="checked" value="${r.id}" >
							</c:if>
							<c:if test="${fn:indexOf(requestScope.info.job,r.id)==-1}">
							<input type="checkbox"  name="job" value="${r.id}" >
							</c:if>
						</c:forEach>
					</span>
						<span class="inputspan"> 
								<label class="inputtext" >学生数量:</label> 
								<input class="inputinput" readonly="readonly" type="text" name="count" value="${requestScope.info.count}" style="width: 160px;"> 
								<label class="inputtext" >试用期:</label> 
								<input class="inputinput" type="text" name="probationPeriod" value="${requestScope.info.probationPeriod}" style="width: 160px;"> 
								</span><span class="inputspan"> 
								<label class="inputtext" >实习工资:</label> 
								<input class="inputinput" type="text" name="internshipWage" value="${requestScope.info.internshipWage}" style="width: 160px;"> 
								<label class="inputtext" >转正工资:</label> 
								<input class="inputinput" type="text" name="officialWage" value="${requestScope.info.officialWage}" style="width: 160px;"> 
								</span><span class="inputspan"> 
								<label class="inputtext"  >学历:</label> 
								<select class="inputselect" name="education"
							style="width: 55px;">
							<c:forEach var="r" items="${requestScope.education}" varStatus="v">
								<c:if test="${requestScope.info.education==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.education!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
							</c:forEach>
							</select> 
								<label class="inputtext" style="width:35px;" >经验:</label> 
	<select class="inputselect" name="experience"
							style="width: 55px;">
							<c:forEach var="r" items="${requestScope.experience}" varStatus="v">
								<c:if test="${requestScope.info.experience==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.experience!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
							</c:forEach>
							</select> 								
<label class="inputtext" style="width:35px;" >性别:</label> 
								
<select class="inputselect" name="sex"
							style="width: 55px;">
							<c:forEach var="r" items="${requestScope.sex}" varStatus="v">
								<c:if test="${requestScope.info.sex==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.sex!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
							</c:forEach>
							</select> 
<label class="inputtext" style="width:35px;" >其他:</label> 
								<input class="inputinput" type="text" name="request" value="${requestScope.info.request}" style="width: 90px;"> 
								
								</span>
								
								
								<span class="inputspan"> 
								<label class="inputtext" >福利待遇:</label> 
								<input class="inputinput" type="text" name="fringeBenefits"  value="${requestScope.info.fringeBenefits}" style="width: 425px;"> 		
							</span>
							<span class="inputspan"> 
								<label class="inputtext" >工作地址:</label> 
								<input class="inputinput" type="text" name="addr"  value="${requestScope.info.addr}" style="width: 425px;"> 		
							</span>
						</div>
					</li>
				</ul>
				<ul>
					<li><div class="inputview1">
						<span class="inputspan"> 
							<label class="inputtext" >使用状态:</label> 
							<select class="inputselect" name="status"
							style="width: 400px;">
							<c:forEach var="r" items="${requestScope.status}" varStatus="v">
								<c:if test="${requestScope.info.status==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.status!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
							</c:forEach>
							</select> 
							</span>
							<span class="inputspan"> 
							<label class="inputtext" >备注: </label> 
							<textarea class="inputinput"  name="comments" style="width:400px;">${requestScope.info.comments}</textarea>	
						</span></div>
					</li>
				</ul>
			</div>
		<div class="inputbtpanel" style="margin-top: -20px">
				<button class="seachbt1"  onclick="layer_close();">取消</button>
				<button class="seachbt1" type="button" onclick="edit();">保存</button>
		</div>
	</form>

  <c:import url="/Model/form_footer.jsp" ></c:import>
