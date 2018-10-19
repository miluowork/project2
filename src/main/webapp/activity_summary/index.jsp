<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>

<script>
   var select=${requestScope.select};
   var txt='${requestScope.txt}';
   var p=${requestScope.result.pageno};
 
 
 function test(){
	 var select1=$("[name='select']").val();
	 var txt1=$("[name='txt']").eq(select1).val() ;
 }
	function fresh(){
		location.href="activity_summary/index?pageno="+p+"&select="+select+"&txt="+txt;
		}
    function openwin(){
	layer_show("报告信息","activity_summary/add",500,700);
	}
	
	function openedit(id){
	layer_show("报告信息","activity_summary/edit?id="+id,500,500);
	}
	
	function openOptions(options){
		layer_show("明细信息","activity_summary/options?options="+options,500,420);
	}
	
function search(){
		$.ajax({
			url : "activity_summary/index",
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
	 $($(".sinput")[s]).css("display","inline").removeAttr("disabled").val(txt);
}); 

$(document).on("change",".sele",function(){
$(".sinput").css("display","none").prop("disabled","disabled");
$($(".sinput")[$(".sele").val()]).css("display","inline").removeAttr("disabled");
}); 
</script>
<style>
td,th{
text-align: center !important;
}

</style>
</head>

<body>
   <span class="printtitle"></span>
     
     <form  id="form" action="activity_summary/index" method="post">
       <div class="searchview">
       <select class="sele searchinput inputselect_long" style="width: 100px"   name="select">
       <option value="0">日期</option>
       <option value="1">活动</option>
       </select>
       <input name="txt"   class="laydate-icon  span1-1 inputinput sinput" id="Calendar1" placeholder=""  style=" width:218px;" />
        <select name="txt" class="inputselect sinput" style="height:30px;display:none">
			<c:forEach items="${requestScope.aList}" var="r" varStatus="v">
					<option value="${r.id}">${r.name}</option>
			</c:forEach>
       </select>
        <button class="seachbt" type="submit">查询</button>
        <button class="seachbt" onclick="openwin();" type="button">新增</button>
       </div>
        </form>
        
    <table class="tablelist" style="table-layout:fixed;overflow:scroll;" >
    	<thead>
    	<tr>
        <th width="100px">活动</th>
        <th width="80px">报告老师</th>
        <th width="150px">创建日期</th>
        <!-- <th width="100px">调查结果</th> -->
        <th width="100px">调查明细</th>
        <th width="60px">学生状况</th>
        <th width="60px">课程状况</th>
        <th width="60px">市场状况</th>
        <th width="60px">学校状况</th>
        <th width="160px">总结</th>
        <th width="160px">建议</th>
        <th width="160px">备注</th>
        <th width="150px">操作</th>  
        </tr>
        </thead>
        
        <tbody>
     
        <c:forEach items="${requestScope.smyList}" var="row" >
 <tr>
        <td>${row.activityName}</td>
        <td>${row.operatorName}</td>
        <td>${row.createdate}</td>
        <%-- <td>${row.options}</td> --%>
        <td><a href="javascript:openOptions('${row.options}');">明细</a></td>
        <td>${requestScope.scxstatus[row.sstatus]}</td>
        <td>${requestScope.tstatus[row.tstatus]}</td>
        <td>${requestScope.scxstatus[row.cstatus]}</td>
        <td>${requestScope.scxstatus[row.xstatus]}</td>
        <td>${row.summary}</td>
        <td>${row.proposal}</td>
        <td>${row.comments}</td>
        <td><a href="javascript:openedit(${row.id});" class="tablelink">修改</a></td>
        </tr>  
  </c:forEach>
       
       
        </tbody>
    </table>
    
    
    


<div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.result.size2}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
    	<i class="blue">${requestScope.result.pageno}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="activity_summary/index?select=${requestScope.select}&txt=${requestScope.txt}&pageno=${requestScope.result.first_pageno}">首页</a></li>
        <li class="paginItem"><a href="activity_summary/index?select=${requestScope.select}&txt=${requestScope.txt}&pageno=${requestScope.result.prev_pageno}">上一页</a></li>
        <li class="paginItem"><a href="activity_summary/index?select=${requestScope.select}&txt=${requestScope.txt}&pageno=${requestScope.result.next_pageno}">下一页</a></li>
        <li class="paginItem"><a href="activity_summary/index?select=${requestScope.select}&txt=${requestScope.txt}&pageno=${requestScope.result.last_pageno}">末页</a></li>
        </ul>
    </div>
<c:import url="/Model/list_footer.jsp" ></c:import>

