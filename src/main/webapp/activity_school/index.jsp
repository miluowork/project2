<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script  type="text/javascript"   src="js/H-ui.admin.js"></script>
<script>
/* var p=${requestScope.result.pageno}; */
function fresh(){
	location.href="activity_school/index";
}
	
	function returnobject(o) {

	}
		
function openwin(){
	
	
	layer_show("增加学院信息","activity_school/add",620,365);
	}
	

	function openedit(id){
		
	layer_show("修改学校信息","activity_school/edit?id="+id,620,265);
	}
	
	function opencollege(id){
		
		layer_show("查看学院信息","activity_college/index?id="+id,1000,500);
		}
	
	
	
	
</script>

</head>

<body>
    <span class="printtitle"></span>
<div class="searchview">
     <form action="Entrance_Company/index" method="post">
    
     
     
     
     	
					
     
     
     
         
        
     	
<!--         <button class="seachbt1  " type="button" onclick="allseach('Company_seach','Entrance_Company/index');">自定义查询</button> -->
        <button style="margin-left: 50px" class="seachbt" type="button" onclick="openwin();">新增</button>
         
        </form>
        </div>
    
    <table class="tablelist" class="table-layout:fixed;">
    	<thead>
    	<tr>
        <th width="15%">编号</th>
        <th width="50%">学校</th>
           
        <th width="10%">操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
        
        
        <tr>
        <td class="bigtext">${row.id}</td>
         <td class="bigtext">${row.name}</td>
       
      
        <td><a href="javascript:openedit(${row.id});" class="tablelink" ">修改</a>
            <a href="javascript:opencollege(${row.id});" class="tablelink" ">学院</a>
        </td>
        
        </tr>  
        
        </c:forEach>
        </tbody>
    </table>
       
     <%-- <div class="pagin">
			<div class="message">
				共<i class="blue">${requestScope.result.size}</i>条记录，共${reques tScope.result.last_pageno}页，当前显示第&nbsp;
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