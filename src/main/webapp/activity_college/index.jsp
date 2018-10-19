<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script  type="text/javascript"   src="js/H-ui.admin.js"></script>
<script>
var p=${requestScope.result.pageno};
function fresh(){
	location.href="activity_college/index?pageno="+p;
}
	
	function returnobject(o) {

	}
		
function openwin(){
	var school_id=$(".select option:selected").val(); 
	
	layer_show("增加学院信息","activity_college/add?school_id="+school_id,620,365);
	}
	

	function openedit(id){
		var school_id=$(".select option:selected").val(); 
	layer_show("修改学院信息","activity_college/edit?id="+id+"&school_id="+school_id,620,265);
	}
	

	
	function selectchange() {
		var school_id=$(".select option:selected").val(); 
		
		window.location.href="activity_college/index?id="+school_id;
	}
	
	
</script>

</head>

<body>
    <span class="printtitle"></span>
<div class="searchview">
     <form action="Entrance_Company/index" method="post">
    
     <label class="searchtext">学校:</label>
     
     
     
     	
					
     
     
         <select class="searchinput inputselect_long select" name="school"  style="width:150px; height: 30px;"   onchange="selectchange();" >
         
         <c:forEach items="${requestScope.slist}" var="r" varStatus="v" >
         
         <c:if test="${requestScope.school_id!=r.id}" >
         <option  value="${r.id}" style="width:100px; height:30px"  >${r.name} </option>
         </c:if>
         
         <c:if test="${requestScope.school_id==r.id}" >
         
         <option  value="${r.id}" selected="selected" style="width:100px; height:30px"  >${r.name} </option>
         </c:if>
         
         </c:forEach>
          
         </select>
         
     
     	
<!--         <button class="seachbt1  " type="button" onclick="allseach('Company_seach','Entrance_Company/index');">自定义查询</button> -->
        <button class="seachbt" type="button" onclick="openwin();">新增</button>
         
        </form>
        </div>
    
    <table class="tablelist" class="table-layout:fixed;">
    	<thead>
    	<tr>
        <th width="15%">编号</th>
        <th width="10%">学校</th>
        <th width="8%">学院</th>       
        <th width="15%">操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${requestScope.clist}" var="row" >
        <c:if  test="${row.school_id!=null}">
        
        <tr>
        <td class="bigtext">${row.id}</td>
         <td class="bigtext">${row.schoolname}</td>
        <td class="bigtext">${row.name}</td>
      
        <td><a href="javascript:openedit(${row.id});" class="tablelink" ">修改</a>

        </td>
        
        </tr>  
        
        
        </c:if>
        </c:forEach>
        </tbody>
    </table>
       
 
  <c:import url="/Model/list_footer.jsp" ></c:import>