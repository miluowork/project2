<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>

<script>
function fresh() {
		location.href = "activity_notice/index";
	}
	
	function returnobject(o) {

	}
		
function openwin(){
	layer_show("添加公告","activity_notice/add",700,550);
	}
	

	function openedit(id){
		
	layer_show("修改","activity_notice/edit?id="+id,700,550);
	}
	
	function openinfo(id){
		
		layer_show("详情","activity_notice/info?id="+id,620,400);
		}
	
	
	
	function selectchange() {
		var options=$(".select option:selected").val(); 
		
		window.location.href="activity_college/index?id="+options;
	}
	
	
	

	/*发货*/
	function article_xianshi(obj,id){
		layer.confirm('确认要显示吗？',function(index){
			
			
			$.post("activity_notice/updateStatus",
					{"id":id,
			          "status":1
					},
					function(json){
				if(json.status>0){
					

			
					
					layer.msg('已显示!',{icon: 6,time:1000});
					
					location.reload();
					
					
					
					
				}else{
					alert(json.text);
				}
					
			},"json");
			
		
			
		});
	}



	/*取消*/
	function article_yincang(obj,id){
		layer.confirm('确认要隐藏吗？',function(index){
			
			
			$.post("activity_notice/updateStatus",
					{"id":id,
			          "status":0
					},
					function(json){
				if(json.status>0){
					

				
					
					layer.msg('已取消!',{icon: 5,time:1000});
					
					location.reload();
					
					
					
					
				}else{
					alert(json.text);
				}
					
			},"json");
			
		
			
		});
	}

	
	
</script>

</head>

<body>
    <span class="printtitle"></span>
<div class="searchview">

   
     <form action="Entrance_Company/index" method="post">
    <!--  <label class="searchtext">企业名称:</label>
     	<input type="hidden" name="table" value="Entrance_Company"/>
       	<input type="hidden" name="col" value="name"/>
       	<input type="hidden" name="ex" value="like"/>
         <input class="searchinput" name="value"/>        
        <button class="seachbt" type="submit">查询</button>
        <button class="seachbt1  " type="button" onclick="allseach('Company_seach','Entrance_Company/index');">自定义查询</button> -->
        <button class="seachbt" type="button" onclick="openwin();">新增</button>
         
        </form>
    
        </div>
    
    <table class="tablelist" class="table-layout:fixed;">
    	<thead>
    	<tr>
        <th width="5%">编号</th>
        <th width="10%">活动名称</th>
        <th width="10%">标题</th>
        <th width="10%">时间</th>
        <th width="8%">管理员</th>   
         <th width="8%">详情</th>
           <th width="8%">状态</th> 
         <th width="8%">操作</th>       
      
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
       
        
        <tr> 
        <td class="bigtext">${row.id}</td>
         <td class="bigtext">${row.name}</td>
          <td class="bigtext">${row.title}</td>
        <td class="bigtext">${row.date}</td>
        <td class="bigtext">${row.operator}</td>
         <td><a  href="javascript:openinfo(${row.id});" >详情</a></td>
         <td class="td-status"><span class="label label-success radius">${row.statuses}</span></td>
        <td><a href="javascript:openedit(${row.id});" class="tablelink" >修改</a>
        
        <c:if test="${row.status==0}">
     
        <a style="text-decoration:none" onClick="article_xianshi(this,${row.id})" href="javascript:;" title="显示"><i class="Hui-iconfont">&#xe69d;</i></a> 
     </c:if>
         <c:if test="${row.status==1}">
     
       <a style="text-decoration:none" onClick="article_yincang(this,${row.id})" href="javascript:;" title="隐藏"><i class="Hui-iconfont"> &#xe69e;</i></a> 
        
        </c:if>
        </td>
        
        </tr>  
        
        
   
        </c:forEach>
        </tbody>
    </table>
       
    <%-- <div class="pagin">
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
		</div> --%>
  <c:import url="/Model/list_footer.jsp" ></c:import>