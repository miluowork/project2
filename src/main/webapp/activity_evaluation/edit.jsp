<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
</head>



  <style>
   .inputspan1{
     margin-left: 50px
   }
   .inputspan{
     margin-left: 70px
   }
   
   input{text-align:center;} 
 </style>

</head>

<body style="min-width:100px;">



	<script  type="text/javascript">

	

	
		
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
   
   
 
   
	
     	<form class="f1" method="post" action="activity_evaluation/update_json" >
     	
     	 <input type="hidden"name="id" value="${requestScope.info.id}" />
     	 <input type="hidden"name="status" value="${requestScope.info.status}" />
		
		
		 
		 
		 
		<span style="margin-left: 140px" class="inputspan">
				<label class="inputtext ">活动:
						</label> 
						 <input type="hidden" name="activity_id"value="${requestScope.info.activity_id}"/>
						 <input
								class="inputinput"  disabled="disabled"
								value="${requestScope.info.activity}" style="width: 200px"
								 />
						
												 
						</span>
						
						
						<span style="margin-left: 140px" class="inputspan">
				<label class="inputtext ">学生:
						</label> 
						
						 <input type="hidden" name="user_id"value="${requestScope.info.user_id}"/>
						 <input
								class="inputinput" disabled="disabled"
								value="${requestScope.info.username}" style="width: 200px"
								 />
						 
						</span>
						
						
    <span style="margin-left: 140px" class="inputspan">
				<label class="inputtext ">分数:
						</label> 
						
								 <input
								class="inputinput" id="title" name="point"
								value="${requestScope.info.point}" style="width: 200px"
								 />
						
						 
						</span>
				
						
						
						
						
				
						
						
						
						<span style="margin-left: 140px" class="inputspan">
				<label class="inputtext ">备注:
						</label> 
						
						 	<textarea class="inputarea1" name="comments" style="width: 250px;height: 100px;resize:none;overflow-x:hidden;" >
						 ${requestScope.info.comments}
						 </textarea>
						 
						
							</span>
		
			
						
				<div class="inputbtpanel" style="margin-top: 70px" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();">保存</button>
				</div>
				
				
				
			
	
		</form>

  <c:import url="/Model/form_footer.jsp" ></c:import>
  </body>