<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script  type="text/javascript"   src="js/H-ui.admin.js"></script>
<script>

  function fresh(){
	location.href="activity_evaluation/index";
    }
	
	function returnobject(o) {

	}


	

	function grade(id) {
		layer_show("打分","activity_evaluation/edit?id="+id,650,400);
	}
	
	
	function batch() {
		
		var ids="";
		$(".chk:checked").each(function(i){
			ids +=$(".chk").eq(i).val()+",";
		});
		ids=ids.substring(0,ids.length-1);
		alert(ids);
		
		layer_show("批量打分","activity_evaluation/batch?ids="+ids,620,365);
		
	}
	
	function changestatus(id) {
		

		$.post("activity_evaluation/changestatus",
				{"id":id
		          },
				function(json){
			if(json.status>0){
				location.reload();
				
			}else{
				alert(json.text);
			}
				
		},"json");
		
	}
	
	
	
	function selectchange() {
		var options=$(".select option:selected").val(); 
		
		window.location.href="activity_college/index?id="+options;
	}
	
	
</script>

</head>

<body>
    <span class="printtitle"></span>
<div class="searchview">
     <form action="activity_evaluation/index" method="post">
   
     <select class="searchinput inputselect_long select" name="activity_id"  style="width:150px; height: 30px;"   >
         
         <c:forEach items="${requestScope.alist}" var="r" varStatus="v" >
         
         <c:if test="${requestScope.activity_id!=r.id}" >
         <option  value="${r.id}" style="width:150px; height:30px"  >${r.name} </option>
         </c:if>
         
         <c:if test="${requestScope.activity_id==r.id}" >
         
         <option  value="${r.id}" selected="selected" style="width:150px; height:30px"  >${r.name} </option>
         </c:if>
         
         </c:forEach>
          
         </select>
     	
   
         
        <button class="seachbt" type="submit" >查询</button>
         
              <button class="seachbt" type="button" onclick="batch();" >批量打分</button>
        </form>
        
    
         
        </div>
    
    <table class="tablelist" class="table-layout:fixed;">
    	<thead>
    	<tr>
        <th width="5%"><input class="" type="checkbox" ></th>
        <th width="10%">活动</th>
        <th width="8%">学生</th>  
        <th width="8%">分数</th> 
        <th width="8%">备注</th>  
        <th width="8%">状态</th>
               
        <th width="15%">操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${requestScope.elist}" var="row" >
      
        
        <tr>
        <td class="bigtext"><input class="chk" type="checkbox" value="${row.id}" ></td>
         <td class="bigtext">${row.activity}</td>
          <td class="bigtext">${row.username}</td>
          
          <c:if test="${row.point==(-1)}">
          <td class="bigtext">--</td>
          </c:if>
           <c:if test="${row.point!=(-1)}">
          <td class="bigtext">${row.point}</td>
          </c:if>
         <td class="bigtext">${row.comments}</td>
         <td class="bigtext">${row.statuses}</td>
      
        <td><a href="javascript:grade(${row.id});" class="tablelink" >打分</a>
        
        <a href="javascript:changestatus(${row.id});" class="tablelink" >状态修改</a>
        </td>




<%--          <a href="Entrance_Company/recode?id=${row.id}"  class="tablelink">回访记录</a> --%>
      <%--  <c:if test="${row.urlok==1}">
        <a href="${row.url}" target="_new" class="tablelink"> 查看主页</a>
        </c:if> --%>
        </td>
        
        </tr>  
        
        
      
        </c:forEach>
        </tbody>
    </table>
       
   <%--  <div class="pagin">
			<div class="message">
				共<i class="blue">${requestScope.result.size}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
				<i class="blue">${requestScope.result.pageno}&nbsp;</i>页
			</div>
			<ul class="paginList">
				<li class="paginItem"><a
					href="activity_college/index?pageno=${requestScope.result.first_pageno}">首页</a>
				</li>
				<li class="paginItem"><a
					href="activity_college/index?pageno=${requestScope.result.prev_pageno}">上一页</a>
				</li>
				<li class="paginItem"><a
					href="activity_college/index?pageno=${requestScope.result.next_pageno}">下一页</a>
				</li>
				<li class="paginItem"><a
					href="activity_college/index?pageno=${requestScope.result.last_pageno}">末页</a>
				</li>
			</ul>
		</div> --%>
  <c:import url="/Model/list_footer.jsp" ></c:import>