<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
</head>

<body style="min-width:100px;">
	<script>
	
	
	
	
	
		function add() {
		
			var data = $(".f1").serializeArray();
			
			$.ajax({
				url : "activity_feedback/updateresult",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				
					if (json.status > 0) {
						

						layer.alert('提交成功',function(){
							
							parent.fresh();
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
		
		<input type="hidden" name="id" value="${requestScope.id}" />
		
			<div class="inputview">
			
			
				<span style="margin-left: 90px" class="inputspan1">
						 <span class="inputtext">回应:
						</span>
						<br>
						 <textarea class="inputarea1" name="result"></textarea>
							</span>
							
					
						
				<div class="inputbtpanel" style="margin-top: 100px" >
					<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
					<button class="seachbt1" type="button" onclick="add();">保存</button>
				</div>
				</div>
		</form>
	
  <c:import url="/Model/form_footer.jsp" ></c:import>
  </body>