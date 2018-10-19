<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
</head>

<body style="min-width:100px;">
	<script>
	
	
		function add() {
			var school_id =$(".select option:selected").val();
			var data = $(".f1").serializeArray();
			
			$.ajax({
				url : "activity_college/insert_json",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				
					if (json.status > 0) {
						
						alert("成功");
						parent.location.href="activity_college/index?id="+school_id;
						layer_close();

					}
				}
			});
		}
		
		
		function edit() {
			
			var school_id =$(".select option:selected").val();
			
			
			var data = $(".f2").serializeArray();
			$.ajax({
				url : "activity_college/update_json",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				
					if (json.status > 0) {
						alert("成功");
						
						parent.location.href="activity_college/index?id="+school_id;
						
						
						layer_close();

					}
				}
			});
		}

		function pageParam(obj) {

		}
	</script>
   
   
 
   
	 <c:if test="${requestScope.info==null}">

		<form class="f1">
			<div class="inputview">
				<span style="margin-left: 140px" class="inputspan">
				<label class="inputtext ">学校:
						</label> 
						
						<select class="searchinput inputselect_long select" name="school_id" style="appearance: none; width: 142px;height: 30px" >
						<c:forEach items="${requestScope.slist}" var="r" >
						<c:if test="${requestScope.school_id!=r.id}">
						<option value="${r.id}" >${r.name}</option>
						</c:if>
						<c:if test="${requestScope.school_id==r.id}">
						<option value="${r.id}" selected="selected" >${r.name}</option>
						</c:if>
						</c:forEach>
						
						</select>
						 
						</span>
	
						<span style="margin-left: 140px" class="inputspan1">
						 <label class="inputtext">学院:
						</label> <input	class="inputinput" id="name2" name="name"/>
							</span>
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="add();"
						>保存</button>
				</div>
			</div>
		</form>
	</c:if>
	<c:if test="${requestScope.info!=null}">
    
		<form class="f2">
		
		<input type="hidden" name="id" value="${requestScope.info.id}" />
		
			<div class="inputview">
			
			
				<span style="margin-left: 140px" class="inputspan">
				
				<label class="inputtext ">学校:
							</label> 
							 
							 
							  <select class="searchinput inputselect_long select" style="appearance: none; width: 142px;height: 30px" name="school_id" >
						<c:forEach items="${requestScope.slist}" var="r" >
						<c:if test="${r.id!=requestScope.info.school_id}" >
						<option value="${r.id}" >${r.name}</option>
						</c:if>
						<c:if test="${r.id==requestScope.info.school_id}" >
						<option value="${r.id}" selected="selected" >${r.name}</option>
						</c:if>
						
						</c:forEach>
						 </select>
							</span>
							
							
							
							
							<span  style="margin-left: 140px" class="inputspan1">
				 <label class="inputtext">学院: 
				 </label>
				 <input	class="inputinput" id="name2" name="name"value="${requestScope.info.name}"
								 />
							 
						</span>
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();">保存</button>
				</div>
				</div>
		</form>
	</c:if> 
  <c:import url="/Model/form_footer.jsp" ></c:import>
  </body>