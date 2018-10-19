<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
<style>
input{
width: 180px;
height: 30px;
text-align: center;
}

select {
    width: 70px;
    height: 37px;
    text-align: center;
    text-align-last: center;
}

option{
text-align:center;
}

textarea{
width:510px;
height:100px;
border:solid 1px #aaa; 
/* resize:none; */
float: left;
margin-left: 5px;
margin-top: 15px !important;
}
.seachbt1{
height: 35px;
} 

*{
font-size: 15px;
font-weight: bold;
}
.chk{
width: 20px;
}
span{
padding: 0;

}
</style>
</head>
<body style="min-width:100px;">
	<script>
	var ids='${requestScope.ids}';
	if(ids==null){
		ids="";
	};
	
	 $(document).ready(function(){
		  if(ids==""){
			  $(".chk").css("display","none");
			  $(".night").css("margin-left","55px");
		  }else{
			  $(".s1").attr("disabled","disabled");
		  }
	  });
	
	 function check(o){
		 if($(o).prev().attr("disabled")!="disabled"){
			 $(o).prev().prop("disabled","disabled"); 
		 }else{
			 $(o).prev().removeAttr("disabled");
		 }
		
	 };
	 
		  function edit(){
				if (name2.value == "") {
					MsgDialog("必须录入名称！", "录入错误");
					return;
				} 
				var data = $(".f2").serializeArray();
				$.ajax({
					url : "activity_checkwork/update_json",
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
		  
	 
		  function edit1(){
			  /* if($(".s1").eq(0).attr("disabled")=="disabled"){
					   $(".s1").eq(0).append("<input name='check1' type='hidden' value='0' name='id' />"); 
			  }
			  if($(".s1").eq(1).attr("disabled")=="disabled"){
					   $(".s1").eq(0).append("<input name='check2' type='hidden' value='0' name='id' />");
			  }
			  if($(".s1").eq(2).attr("disabled")=="disabled"){
					   $(".s1").eq(0).append("<input name='check3' type='hidden' value='0' name='id' />"); 
			  } */
			   
			  
				if (name2.value == "") {
					MsgDialog("必须录入名称！", "录入错误");
					return;
				} 
				var data = $(".f2").serializeArray();
				$.ajax({
					url : "activity_checkwork/AllUpdate_json",
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
	  
	        /* function chkNum(){
	        	var map = {};
	        	$(".s1").each(function(i){
	        		if($(".s1").eq(i).attr("disabled")!="disabled"){
	        			var name=$(".s1").eq(i).attr("name");
	        			alert(name);
	        			var val=$(".s1").eq(i).val();
	        			alert(val);
	        			map[name] = val;
	        			var value = map[name];// Object value = map.get(key);
	        			alert(value);
	        		}
	        	});
	        	$(".map").val(map);
	        } */
	 
		
	</script>

	

		<form class="f2">
			<div class="inputview">
			
			<c:if test="${requestScope.ids==null}">
			    <input type="hidden" value="${requestScope.infos.id}" name="id" />
			    <input type="hidden" value="${requestScope.infos.date}" name="date" />
			    <input type="hidden" value="${requestScope.infos.activity_id}" name="activity_id" />
			    <input type="hidden" value="${requestScope.infos.user_id}" name="user_id" />
			    <input type="hidden" value="${requestScope.infos.operator_id}" name="operator_id" />
			</c:if>
			
			<c:if test="${requestScope.ids!=null}">
			    <input type="hidden" value="${requestScope.ids}" name="ids" />
			    <!-- <input type="hidden" name="map" class="map"  /> -->
			</c:if>
			
				
				<span class="inputspan">
				    <c:if test="${requestScope.ids==null}">
					<label class="inputtext ">姓名:</label>
					<input disabled="disabled" value="${requestScope.infos.userName}" />
					</c:if>
					
					<c:if test="${requestScope.ids!=null}">
					<label class="inputtext ">成员:</label>
					<input  disabled="disabled" value="${requestScope.name}" />
					</c:if>
					
					
					<label style="margin-left:55px !important;" class="inputtext ">早上:</label> 
					<select name="check1" class="s1 searchinput inputselect_long" lay-filter="aihao">
				        <c:forEach items="${requestScope.checkes}"  var="r" varStatus="v">
					               <c:if test="${requestScope.infos.check1!=v.index}">
						               <option value="${v.index}" id="name2">${r}</option>
						           </c:if>
						           <c:if test="${requestScope.infos.check1==v.index}">
						               <option selected="selected" value="${v.index}" id="name2">${r}</option>
						           </c:if>
				        </c:forEach>
				   </select>
				   
				    <input onclick="check(this)" type="checkbox" class="chk" />
				   
				  
				</span>
				
				 <span class="inputspan">
						<label class="inputtext ">中午:</label> 
						<select  name="check2" class="s1 searchinput inputselect_long" lay-filter="aihao">
					        <c:forEach items="${requestScope.checkes}"  var="r" varStatus="v">
					              <c:if test="${requestScope.infos.check2!=v.index}">
						               <option value="${v.index}" id="name2">${r}</option>
						          </c:if>
						          <c:if test="${requestScope.infos.check2==v.index}">
						               <option selected="selected" value="${v.index}" id="name2">${r}</option>
						          </c:if>
						          
					        </c:forEach>
					    </select>
					     <input onclick="check(this)" type="checkbox" class="chk" />
					     
					   <label style="margin-left: 30px" class="night inputtext ">晚上:</label> 
						<select name="check3" class="s1 searchinput inputselect_long" lay-filter="aihao">
					        <c:forEach items="${requestScope.checkes}"  var="r" varStatus="v">
						            <c:if test="${requestScope.infos.check3!=v.index}">
						               <option value="${v.index}" id="name2">${r}</option>
						            </c:if>
						            <c:if test="${requestScope.infos.check3==v.index}">
						               <option selected="selected" value="${v.index}" id="name2">${r}</option>
						            </c:if>
					        </c:forEach>
					   </select>
					    <input onclick="check(this)" type="checkbox" class="chk" />
				</span>
				
				<span class="inputspan">
					<label class="inputtext " style="float: left;">备注:</label> 
					<textarea  rows="10" cols="50" name="comments">${requestScope.infos.comments}</textarea>
				</span>
				
				<div class="inputspan btns " style="margin-top: 100px!important;margin-left:180px!important;" >
					<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
						<c:if test="${requestScope.ids==null}">
					    <button class="seachbt1" type="button" onclick="edit();">保存</button>
					    </c:if>
					    <c:if test="${requestScope.ids!=null}">
					    <button class="seachbt1" type="button" onclick="edit1();">保存</button>
					    </c:if>
				</div>
				</div>
		</form>
	
	
  <c:import url="/Model/form_footer.jsp" ></c:import>