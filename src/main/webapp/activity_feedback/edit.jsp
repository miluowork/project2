<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
</head>

<body style="min-width:100px;">
	<script>
	
	$(function() {
		
		
		
		if(${requestScope.status}==1){
			
			
			layer.alert('您已完成本日调查问卷，不用再次作答',function(){
				
			
				layer_close();
			
			});
			
			
		}
	
		
		
	});
	
	
	
	
		function add() {
		
			var data = $(".f1").serializeArray();
			
			$.ajax({
				url : "activity_feedback/insert_json",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				
					if (json.status > 0) {
						

						layer.alert('提交成功',function(){
							
						
							layer_close();
						
						});
						
					

					}
				}
			});
		}
		
		
		

		function pageParam(obj) {

		}
	</script>
   
   
 
   
	 
	
    
		<form class="f1">
		
		<input type="hidden" name="activity_id" value="${sessionScope.activity_id}" />
		<input type="hidden" name="user_id" value="${sessionScope.userid}" />
		<input type="hidden" name="date" value="${requestScope.date}" />
		<input type="hidden" name="status" value="1" />
			<div class="inputview">
			
			
				<span style="margin-left: 250px" class="inputspan1">
						 <span class="inputtext">问题一:
						</span>
						<br>
						 <textarea class="inputarea1" name="text1"></textarea>
							</span>
							
							
								<br>
								
								<span style="margin-left: 250px" class="inputspan1">
						 <span class="inputtext">问题二:
						</span>
						<br>
						 <textarea class="inputarea1" name="text2"></textarea>
							</span>
							
							
								<br>
										<br>
							
							<span  style="margin-left: 250px" class="inputspan1">
				 <span class="inputtext" style="width: 300px">问题1:
						</span>
						<br>
				 <span class="inputtext" style="width: 300px">
				 
				 A:非常满意    B:满意   C:一般   D:不满意
						</span>
						<br>
				
				<input style="margin-left: 20px"	class="radio" type="radio" id="opt1" name="opt1"value="1"/>
				<input style="margin-left: 40px"	class="radio" type="radio" id="opt1" name="opt1"value="2"/>
				<input style="margin-left: 40px"	class="radio" type="radio" id="opt1" name="opt1"value="3"/>
				<input style="margin-left: 40px"	class="radio" type="radio" id="opt1" name="opt1"value="4"/>	 
						</span>
						
						<br>
						
						
							<br>
							
							<span  style="margin-left: 250px" class="inputspan1">
				 <span class="inputtext" style="width: 300px">问题2:
						</span>
						<br>
				 <span class="inputtext" style="width: 300px">
				 
				 A:非常满意    B:满意   C:一般   D:不满意
						</span>
						<br>
				
				<input style="margin-left: 20px"	class="radio" type="radio" id="opt2" name="opt2"value="1"/>
				<input style="margin-left: 40px"	class="radio" type="radio" id="opt2" name="opt2"value="2"/>
				<input style="margin-left: 40px"	class="radio" type="radio" id="opt2" name="opt2"value="3"/>
				<input style="margin-left: 40px"	class="radio" type="radio" id="opt2" name="opt2"value="4"/>	 
						</span>
						
						<br>
						
							<br>
							
							<span  style="margin-left: 250px" class="inputspan1">
				 <span class="inputtext" style="width: 300px">问题3:
						</span>
						<br>
				 <span class="inputtext" style="width: 300px">
				 
				 A:非常满意    B:满意   C:一般   D:不满意
						</span>
						<br>
				
				<input style="margin-left: 20px"	class="radio" type="radio" id="opt3" name="opt3"value="1"/>
				<input style="margin-left: 40px"	class="radio" type="radio" id="opt3" name="opt3"value="2"/>
				<input style="margin-left: 40px"	class="radio" type="radio" id="opt3" name="opt3"value="3"/>
				<input style="margin-left: 40px"	class="radio" type="radio" id="opt3" name="opt3"value="4"/>	 
						</span>
						
						<br>
						<br>
						
						
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="add();">保存</button>
				</div>
				</div>
		</form>
	
  <c:import url="/Model/form_footer.jsp" ></c:import>
  </body>