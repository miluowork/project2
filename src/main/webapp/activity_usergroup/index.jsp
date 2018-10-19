<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>

<script>
 /* var select=${requestScope.select}; */
 var txt='${requestScope.txt}'; 
 var p=${requestScope.result.pageno};
      
    
 
    function returnobject(o){
	    
	} 
	function fresh(){
		location.href="activity_usergroup/index?pageno="+p+"&select="+select+"&txt="+txt;
		}
    function openwin(){
	layer_show("分组","activity_usergroup/add",820,300);
	}
	
	function openedit(id){
	layer_show("修改信息","activity_usergroup/edit?id="+id,820,300);
	}
	
	function openPoints(id){
		layer_show("打分","activity_usergroup/points?id="+id,470,430);
		}
	function openS_Points(id){
		layer_show("打分","activity_usergroup/points?id="+id,470,400);
		}
	function openMembers(id){
		var a=1;
		layer_show("成员详情","activity_usergroup/points?id="+id+"&a="+1,300,200);
		}
	/* function members(id){
		layer_show("成员详情","activity_usergroup/members?id="+id,270,230);
		} */
	
function search(){
		$.ajax({
			url : "activity_usergroup/index",
			type : "post",
			data : JSON.stringify($("#form").serialize()),
			dataType : "json",
			success : function(json) {
			/* event.srcElement.disabled=false; */
				if (json.status > 0) {
					/* parent.fresh(); */
					layer_close();

				}
			}
		});
}

$(function(){
	/* $(".sele").val(select);
    var s=$(".sele").val();
	$(".sinput").css("display","none").prop("disabled","disabled"); 
	$(".sinput").css("display","inline").removeAttr("disabled").val(txt);*/
	$(".sinput").val(txt);
});

/* $(document).on("change",".sele",function(){
$(".sinput").css("display","none").prop("disabled","disabled");
$($(".sinput")[$(".sele").val()]).css("display","inline").removeAttr("disabled");
});  */
</script>
</head>
<body>
   <span class="printtitle"></span>
     
     <form  id="form" action="activity_usergroup/index" method="post">
       <div class="searchview">
       <!-- <select class="sele searchinput inputselect_long" style="width: 100px" name="select" >
       <option value="0">日期</option>
       <option value="1">活动</option>
       </select> -->
       <!-- <input name="txt" class="laydate-icon  span1-1 inputinput sinput" id="Calendar1" placeholder=""  style=" width:218px;" /> -->
        <label style="width:50px;height:30px;">活动</label>
        <select name="txt" class="inputselect sinput" style="height:30px;text-align: center">
			<c:forEach items="${requestScope.aList}" var="r" varStatus="v">
					<option value="${r.id}">${r.name}</option>
			</c:forEach>
       </select>
        <button class="seachbt" type="submit">查询</button>
        <c:if test="${requestScope.type<=2}">
        <button class="seachbt" onclick="openwin();" type="button">分组</button>
        </c:if>
       </div>
        </form>
        
    <table class="tablelist" style="table-layout: fixed;" >
    	<thead>
    	<tr>
        <th width="100px">活动</th>
        <th width="100px">项目</th>
        <th width="100px">组名</th>
        <th width="80px">备注</th>
        <th width="150px">操作</th>  
        </tr>
        </thead>
        <tbody>
     
        <c:forEach items="${requestScope.ugList}" var="row" >
 <tr>
        <td class="bigtext">${row.activityName}</td>
        <td class="bigtext">${row.project}</td>
        <td class="bigtext">${row.groupname}</td>
        <td class="bigtext">${row.comments}</td>
        <td>
        <!--操作员页面  -->
        <c:if test="${requestScope.type<=2}">
        <a href="javascript:openedit(${row.id});" class="tablelink" >修改</a>
        <a href="javascript:openPoints(${row.id});" class="tablelink" >打分</a>
        </c:if>
        <!--导员页面  -->
        <c:if test="${requestScope.type>=3}">
        <a href="javascript:openS_Points(${row.id});" class="tablelink" >评分情况</a>
        </c:if>
        
        <a href="javascript:openMembers(${row.id});" class="tablelink" >成员</a>
        </td>
 </tr>  
  </c:forEach>
       
       
        </tbody>
    </table>
    
    
    


<div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.result.size2}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
    	<i class="blue">${requestScope.result.pageno}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="activity_usergroup/index?txt=${requestScope.txt}&pageno=${requestScope.result.first_pageno}">首页</a></li>
        <li class="paginItem"><a href="activity_usergroup/index?txt=${requestScope.txt}&pageno=${requestScope.result.prev_pageno}">上一页</a></li>
        <li class="paginItem"><a href="activity_usergroup/index?txt=${requestScope.txt}&pageno=${requestScope.result.next_pageno}">下一页</a></li>
        <li class="paginItem"><a href="activity_usergroup/index?txt=${requestScope.txt}&pageno=${requestScope.result.last_pageno}">末页</a></li>
        </ul>
    </div>
<c:import url="/Model/list_footer.jsp" ></c:import>

