<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<script type="text/javascript" src="js/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>


<body style="min-width:100px;">
	<script>
	

	

	
	function add() {
		
		var opassword = $("#opassword").val();
		var npassword1 = $("#npassword").val();
		var npassword2 = $("#nnpassword").val();
		
		var data = $(".f1").serializeArray();
		
		if(opassword==npassword1){
			layer.alert("新密码不能与相同");
		
		}
		if(npassword1!=npassword2){
			layer.alert("确认密码与新密码不一致");
		}else if(opassword!=npassword1&&npassword1==npassword2){
			

		
			
			
			$.ajax({
				url : "changepass",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				
					if (json.status > 0) {
						
						layer.alert("成功");
						
						layer_close();

					}
					if(json.status==-1){
						
						layer.alert(json.text);
					}else{
						layer.alert(json.text);
					}
				}
			});
		}
        
		
		
	}
		

		function pageParam(obj) {

		}
	</script>
   
   
 
   
	 
	
    
		<form class="f1">
		
	
			<div class="inputview">
			
			
			  <span style="margin-left: 70px" class="inputspan">
				<label class="inputtext ">原密码:
						</label> 
						
								 <input
								class="inputinput" id="opassword" name="opassword"
								value="${requestScope.info.point}" style="width: 150px"
								 />
						
						 
						</span>
							<br>
							
								<br>
							  <span style="margin-left: 70px" class="inputspan">
				<label class="inputtext ">新密码:
						</label> 
						
								 <input
								class="inputinput" id="npassword" type="password" name="npassword1"
								value="${requestScope.info.point}" style="width: 150px"
								 />
						
						 
						</span>
								
						
						<br>
						
						
								<br>
							  <span style="margin-left: 55px" class="inputspan">
				<label class="inputtext ">确认密码:
						</label> 
						
								 <input
								class="inputinput" id="nnpassword" type="password" name="npassword2"
								value="${requestScope.info.point}" style="width: 150px"
								 />
						
						 
						</span>
								
							<br>
						<br>
						
						
				<div style="margin-left: 130px" class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="add();">确认</button>
				</div>
				</div>
		</form>
	

  </body>