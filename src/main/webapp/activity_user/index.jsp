<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script>
  var select=${requestScope.select}; 
  var txt=${requestScope.txt};
  var p=${requestScope.result.pageno};
  
    function returnobject(o){
	
	} 
	function fresh(){
		location.href="activity_user/index?pageno="+p+"&select="+select+"&txt="+txt;
		}
    function openwin(){
	layer_show("用户信息","activity_user/add",800,330);
	}
	
    openedit=function(id){
	layer_show("用户信息","activity_user/edit?id="+id,800,370);
	}
	
    function search(){
		$.ajax({
			url : "activity_user/index",
			type : "post",
			data : JSON.stringify($("#form").serialize()),
			dataType : "json",
			success : function(json) {
				if (json.status > 0) {
					layer_close();
				}
			}
		});
   }

   $(function(){
		$(".sele").val(select);
	    var s=$(".sele").val();
		$(".sinput").css("display","none").prop("disabled","disabled");
		if(s==6){
			$(".s1").css("display","inline").removeAttr("disabled").val(txts);
			$($(".sinput")[s]).css("display","inline").removeAttr("disabled").val(txt);
			
		}else{
			$($(".sinput")[s]).css("display","inline").removeAttr("disabled").val(txt);
		}
		
   });

   $(document).on("change",".sele",function(){
	 
	    var s=$(".sele").val();
	    $(".s1").css("display","none").prop("disabled","disabled");
		$(".sinput").css("display","none").prop("disabled","disabled");
		$($(".sinput")[$(".sele").val()]).css("display","inline").removeAttr("disabled");
		if(s==6){
			$(".s1").css("display","inline").removeAttr("disabled");
		}
   }); 
   function changer(o){
		$(o).next().remove();
		 $.getJSON("activity_user/getCollegeList",{school_id:o.value},function(json){//地址，值，function(后台传过来的集合，转为json数组)
			console.log(json);
			if(json.length>0){
				/* var lab=$("<label class='sele '></label>"); */
				var select=$("<select style='margin-left:5px' class='sele sinput searchinput inputselect_long' name='txt'></select>");
				for(var i=0;i<json.length;i++){
					select.append($("<option value='"+json[i].id+"'>"+json[i].name+"</option>"));//下拉框内追加option
				}
				$(o).after(select);//当前元素之后追加下拉框
			    /* $(".sele").before(lab);  */
				
			}
		}); 
	};
</script>
<style>
td,th{
text-align: center !important;
}
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
</style>
</head>


<body>
   <span class="printtitle"></span>
     <form  id="form" action="activity_user/index" method="post">
       <div class="searchview">
       <select class="sele searchinput inputselect_long"  style="width: 100px" name="select">
      <!--  <option value="0">日期</option> -->
       <option value="0">用户手机号</option>
       <option value="1">用户类型</option>
       <!-- <option value="3">意向</option>
       <option value="4">关注等级</option>
       <option value="5">状态等级</option>
       <option value="6">院校</option> -->
       
       </select>
       
       	<!-- <input type="hidden" name="table" value="activity_user"/>
       	<input type="hidden" name="col" value="name"/>
       	<input type="hidden" name="ex" value="like"/> -->
        
        
       <!--  <input name="txt" class="laydate-icon  span1-1 inputinput sinput" id="Calendar1" placeholder=""  style="width:218px;" /> -->
        <input name="txt" type="text"  class="text_add inputselect sinput" placeholder=""  style=" width:200px;display:none"/>
        <select  name="txt" class="inputselect sinput" style="height:30px;display:none">
			<c:forEach items="${requestScope.type}" var="r" varStatus="v">
				<c:if test="${requestScope.infos.type!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.infos.type==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
       </select>
        <%-- <select  name="txt" class="inputselect sinput" style="height:30px;display:none">
			<c:forEach items="${requestScope.ylevel}" var="r" varStatus="v">
				<c:if test="${requestScope.infos.ylevel!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.infos.ylevel==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
       </select>
        <select  name="txt" class="inputselect sinput" style="height:30px;display:none">
			<c:forEach items="${requestScope.glevel}" var="r" varStatus="v">
				<c:if test="${requestScope.infos.glevel!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.infos.glevel==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
       </select>
       <select  name="txt" class="inputselect sinput" style="height:30px;display:none">
			<c:forEach items="${requestScope.slevel}" var="r" varStatus="v">
				<c:if test="${requestScope.infos.slevel!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.infos.slevel==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
       </select>
       
       <select onclick="changer(this)" name="txts" class="s1 searchinput inputselect_long" style="height:30px;display:none">
				        <c:forEach items="${requestScope.sList}"  var="r" varStatus="v">
					               <option value="${r.id}">${r.name}</option>
				        </c:forEach>
	   </select>
				   
	   <!-- <label class='inputtext searchinput inputselect_long'>学院:</label> -->
	    
	   <select class='sinput searchinput inputselect_long' name="txt" style="height:30px;display:none">
				   <c:forEach items="${requestScope.cList}"  var="row" varStatus="v">
				      <c:if test="${row.school_id==1}">
					     <option value="${row.id}">${row.name}</option>
					  </c:if>
				    </c:forEach>
	   </select> --%>
      
       
        <button class="seachbt" type="submit">查询</button>
        <button class="seachbt" onclick="openwin();" type="button">添加导员</button>
        </div>
        </form>
        
    <table class="tablelist" style="table-layout: fixed;overflow: scroll;">
    	<thead>
    	<tr>
        <th width="80px">姓名</th>
        <th width="80px">性别</th>
        <th width="80px">类型</th>
        <th width="120px">电话</th>
        <th width="80px">班级详情</th>
        <th width="120px">学校</th>
        <th width="150px">学院</th> 
        <th width="80px">意向</th>
        <th width="80px">关注等级</th>
        <th width="80px">状态等级</th>
        <th width="80px">状态</th>
        <th width="100px">操作</th>  
        </tr>
        </thead>
        
        <tbody>
     
        <c:forEach items="${requestScope.uList}" var="row" >
      <tr>
        <td>${row.name}</td>
        <td>${requestScope.sex[row.sex]}</td>
        <td>${requestScope.type[row.type]}</td>
        <td>${row.tel}</td>
        <td>${row.classinfo}</td>
        <td>
        <c:forEach items="${requestScope.sList}" var="s">
        <c:if test="${s.id==row.school_id}">
        ${s.name}
        </c:if>
        </c:forEach>
        </td>
        <td>
        <c:forEach items="${requestScope.cList}" var="c">
        <c:if test="${c.id==row.college_id}">
        ${c.name}
        </c:if>
        </c:forEach>
        </td>
        <td>${requestScope.ylevel[row.ylevel]}</td>
        <td>${requestScope.glevel[row.glevel]}</td>
        <td>${requestScope.slevel[row.slevel]}</td>
        <%-- <td>${row.info}</td> --%>
        <td>${requestScope.status[row.status]}</td>
        <td><a href="javascript:openedit(${row.id});" class="tablelink" >修改</a></td>
      </tr>  
  </c:forEach>
       
       
        </tbody>
    </table>
    
    
    


    <div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.result.size2}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
    	<i class="blue">${requestScope.result.pageno}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="activity_user/index?select=${requestScope.select}&txt=${requestScope.txt}&pageno=${requestScope.result.first_pageno}">首页</a></li>
        <li class="paginItem"><a href="activity_user/index?select=${requestScope.select}&txt=${requestScope.txt}&pageno=${requestScope.result.prev_pageno}">上一页</a></li>
        <li class="paginItem"><a href="activity_user/index?select=${requestScope.select}&txt=${requestScope.txt}&pageno=${requestScope.result.next_pageno}">下一页</a></li>
        <li class="paginItem"><a href="activity_user/index?select=${requestScope.select}&txt=${requestScope.txt}&pageno=${requestScope.result.last_pageno}">末页</a></li>
        </ul>
    </div>
<c:import url="/Model/list_footer.jsp" ></c:import>

