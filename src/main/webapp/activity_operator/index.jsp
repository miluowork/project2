<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script>
</script>
</head>
<script type="text/javascript">
function fresh() {
	location.href = "activity_operator/index?pageno=${requestScope.info.pageno}";
}
function returnobject(o) {
}
deletethis=function(id){
	var r=confirm("delt it?");
	if (r==true)
	  {
	$.ajax({ 
			url: "activity_operator/delete",
            method:'post',
            data:{id:id},
            success:function(data){
            	  $(".chk").each(function(){
            		  if($(this).attr("thisid")==id){
              			$(this).parent(".tr").remove();
              			}
            		});
            },
            error:function(data){
                alert("服务器繁忙");
            }
        });
	  }
}
openwin=function(){
	layer_show("增加","activity_operator/add",620,365);
}
editwin=function(id){
	layer_show("编辑","activity_operator/edit?id="+id,620,365);
}
selectonchange=(function(){
	if($(".select").val()==0){
		$(".txt").prop("hidden","hidden");
		$(".txt").removeProp("name");
		$(".selecttxt").prop("hidden","hidden");
		$(".selecttxt").removeProp("name");
		$(".type").removeProp("hidden");
		$(".type").prop("name","selecttxt");
	}else if($(".select").val()==1){
		$(".txt").prop("hidden","hidden");
		$(".txt").removeProp("name");
		$(".selecttxt").prop("hidden","hidden");
		$(".selecttxt").removeProp("name");
		$(".power").removeProp("hidden");
		$(".power").prop("name","selecttxt");
	}else{
		$(".txt").removeProp("hidden");
		$(".txt").prop("name","txt");
		$(".selecttxt").prop("hidden","hidden");
		$(".selecttxt").removeProp("name");
	}
});$(function(){
	selectonchange();
})
</script>
<body>
   <span class="printtitle"></span>
     <form action="activity_operator/index" method="post">
       <div class="searchview">
       <label class="searchtext"><b>查询方式：</b></label>
        <select class="select searchinput inputselect_long" name="select" onchange="selectonchange();">
        <c:forEach items="${requestScope.selectarray}" var="s" varStatus="ss">
        	<c:if test="${ss.index==info.select}">
        	<option value="${ss.index}" selected="selected">${s}</option>
        	</c:if>
        	<c:if test="${ss.index!=info.select}">
        	<option value="${ss.index}" >${s}</option>
        	</c:if>
       	</c:forEach>
        </select>
         <input class="searchinput txt" name="txt" style="width: 180px" value="${requestScope.info.txt}"/>
         <select name="selecttxt" class="selecttxt type searchinput inputselect_long">
         	<c:forEach items="${requestScope.typeArray}" var="t" varStatus="ts">
         	<c:if test="${info.selecttxt==ts.index}">
         		<option selected="selected" value="${ts.index}">${t}</option>
         	</c:if>
         	<c:if test="${info.selecttxt!=ts.index}">
         		<option value="${ts.index}">${t}</option>
         	</c:if>
         	</c:forEach>
         </select>
          <select name="selecttxt" class="selecttxt power searchinput inputselect_long">
         	<c:forEach items="${requestScope.powerArray}" var="t" varStatus="ts">
         	<c:if test="${info.selecttxt==ts.index}">
         		<option selected="selected" value="${ts.index}">${t}</option>
         	</c:if>
         	<c:if test="${info.selecttxt!=ts.index}">
         		<option value="${ts.index}">${t}</option>
         	</c:if>
         	</c:forEach>
         </select>
        <button class="seachbt search" type="submit">查询</button>
         <button class="seachbt" onclick="openwin();" type="button">新增</button>
       </div>
        </form>
    <table class="tablelist">
    	<thead>
    	<tr>
    	<th></th>
        <th width="10%">id</th>
        <th width="10%">权限</th>
        <th width="10%">状态</th>
        <th width="10%">昵称</th>
        <th width="10%">姓名</th>
        <th width="10%">类型</th>
        <th width="10%">电话</th>
        <th width="10%">备注</th> 
        <th width="10%">操作</th>     
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
 <tr class="tr">	
 		<td  class="chk" thisid="${row.id}"><input type="checkbox"></td>
        <td>${row.id}</td>
        <td>${requestScope.powerArray[row.power]}</td>
        <td>${requestScope.statusArray[row.status]}</td>
        <td>${row.niki}</td>
        <td>${row.name}</td>
        <td>${requestScope.typeArray[row.type]}</td>
        <td>${row.tel}</td>
        <td>${row.comments}</td>
        <td>
        <a href="javascript:void(0);" class="tablelink" onclick="editwin(${row.id});">修改</a>
        <a href="javascript:void(0);" class="tablelink" onclick="deletethis('${row.id}');">删除</a></td>
        </tr>  
  </c:forEach>
        </tbody>
    </table>
<div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.max}</i>条记录，共${requestScope.info.maxPage}页，当前显示第&nbsp;
    	<i class="blue">${requestScope.info.pageno}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="activity_operator/index?txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=1">首页</a></li>
        <li class="paginItem"><a href="activity_operator/index?txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=${requestScope.info.prev}">上一页</a></li>
        <li class="paginItem"><a href="activity_operator/index?txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=${requestScope.info.next}">下一页</a></li>
        <li class="paginItem"><a href="activity_operator/index?txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=${requestScope.info.maxPage}">末页</a></li>  
        </ul>
    </div>
<c:import url="/Model/list_footer.jsp" ></c:import>

