<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script  type="text/javascript"   src="js/H-ui.admin.js"></script>
<script>
function fresh() {
		location.href = "Entrance_Company/index";
	}
	function returnobject(o) {

	}
		
function openwin(){
	layer_show("就业企业","Entrance_Company/edit",620,365);
	}
	function openedit(id){
	layer_show("企业编辑","Entrance_Company/edit?id="+id,620,365);
	}
</script>

</head>

<body>
    <span class="printtitle"></span>
<div class="searchview">
     <form action="Entrance_Company/index" method="post">
     <label class="searchtext">企业名称:</label>
     	<input type="hidden" name="table" value="Entrance_Company"/>
       	<input type="hidden" name="col" value="name"/>
       	<input type="hidden" name="ex" value="like"/>
         <input class="searchinput" name="value"/>        
        <button class="seachbt" type="submit">查询</button>
        <button class="seachbt1  " type="button" onclick="allseach('Company_seach','Entrance_Company/index');">自定义查询</button>
        <button class="seachbt" type="button" onclick="openwin();">新增</button>
         
        </form>
        </div>
    
    <table class="tablelist" class="table-layout:fixed;">
    	<thead>
    	<tr>
        <th width="15%">企业名称</th>
        <th width="10%">电话</th>
        <th width="8%">联系人</th>
        <th  width="10%">就职要求</th>
        <th width="6%">学生数量</th>
        <th width="7%">使用状态</th>
        <th  width="5%">备注</th>
        <th width="15%">操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
        <tr>
        <td class="bigtext">${row.name}</td>
        <td class="bigtext">${row.tel}</td>
        <td class="bigtext">${row.contacts}</td>
        <td class="bigtext">${row.request}</td>
        <td>${row.count}</td>
        <td>${row.status_name}</td>
        <td>${row.comments}</td>
        <td><a href="javascript:openedit(${row.id});" class="tablelink" ">修改</a>
         <a href="Entrance_Company/recode?id=${row.id}"  class="tablelink">回访记录</a>
       <c:if test="${row.urlok==1}">
        <a href="${row.url}" target="_new" class="tablelink"> 查看主页</a>
        </c:if>
        </td>
        
        </tr>  
        </c:forEach>
        </tbody>
    </table>
       
    <div class="pagin">
			<div class="message">
				共<i class="blue">${requestScope.result.size}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
				<i class="blue">${requestScope.result.pageno}&nbsp;</i>页
			</div>
			<ul class="paginList">
				<li class="paginItem"><a
					href="Entrance_Company/index?pageno=${requestScope.result.first_pageno}">首页</a>
				</li>
				<li class="paginItem"><a
					href="Entrance_Company/index?pageno=${requestScope.result.pro_pageno}">上一页</a>
				</li>
				<li class="paginItem"><a
					href="Entrance_Company/index?pageno=${requestScope.result.next_pageno}">下一页</a>
				</li>
				<li class="paginItem"><a
					href="Entrance_Company/index?pageno=${requestScope.result.last_pageno}">末页</a>
				</li>
			</ul>
		</div>
  <c:import url="/Model/list_footer.jsp" ></c:import>