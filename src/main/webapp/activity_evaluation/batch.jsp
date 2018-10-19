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
   
   
 
   


		<form class="f1" method="post" action="activity_evaluation/batchupdate" >
			
     	
     	 <input type="hidden"name="ids" value="${requestScope.ids}" />
		 
		
		 
		 
		
						
    <span style="margin-left: 150px;margin-top: 50px" class="inputspan">
				<label class="inputtext ">分数:
						</label>
								 <input
								class="inputinput" id="title" name="point"
								value="" style="width: 150px"
								 />			 
						</span>
				
						
			
						
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();">保存</button>
				</div>
				
				
				
			
	
		</form>

  <c:import url="/Model/form_footer.jsp" ></c:import>
  </body>