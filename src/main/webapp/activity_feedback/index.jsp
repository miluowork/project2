<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/Model/list_head.jsp" ></c:import>



<script  type="text/javascript"   src="js/H-ui.admin.js"></script>
<script>
function fresh() {
		location.href = "activity_feedback/index";
	}
	
	function returnobject(o) {
		

	}
		
	
	
 function add(){
	 var activity_id=$(".select option:selected").val(); 
	 
	 
	 
		$.post("activity_feedback/addall",
				{"activity_id":activity_id
		          },
				function(json){
			if(json.status>0){
				

			
				
				location.reload();
				
				
				
				
			}else{
				alert(json.text);
			}
				
		},"json");
	 
	
	
	}
 
 
 function selectchange(o){
	 
		$(o).next().remove();
		 $.getJSON("activity_feedback/activitychange",{activity_id:o.value},function(json){//地址，值，function(后台传过来的集合，转为json数组)
			console.log(json);
			if(json.length>0){
				/* var lab=$("<label class='sele '></label>"); */
				var select=$("<select class='searchinput inputselect_long select2' name='date'  style='width:100px; height: 30px;'>    </select>");
				for(var i=0;i<json.length;i++){
					select.append($("<option value='"+json[i].date+"'>"+json[i].date+"</option>"));//下拉框内追加option
				}
				
				$(o).after(select);//当前元素之后追加下拉框
			    /* $(".sele").before(lab);  */
				
			}
		}); 
	};

	
	function statusshows(id) {
		

		$.post("activity_feedback/changestatus",
				{"id":id,
			     "status":1
		          },
				function(json){
			if(json.status>0){
	
				location.reload();
		
				
			}else{
				alert(json.text);
			}
				
		},"json");
		
	}
	
function statushid(id) {
	
	$.post("activity_feedback/changestatus",
			{"id":id,
		     "status":0
	          },
			function(json){
		if(json.status>0){

			location.reload();
	
			
		}else{
			alert(json.text);
		}
			
	},"json");
		
	}

 
    function openresult(id){
			
    
    	layer_show("回应","activity_feedback/fresult?id="+id,600,300);
		
	}
    
    
     
	
/* 	function selectchange() {
		var activity_id=$(".select option:selected").val(); 
		
		window.location.href="activity_feedback/index?activity_id="+activity_id;
	} */
 
				/*
	function openedit(id){
		
	layer_show("修改学院信息","activity_feedback/edit.jsp?id="+id,620,400);
	}
	
	 */
	
	/* function selectchange() {
		var options=$(".select option:selected").val(); 
		
		window.location.href="activity_college/index?id="+options;
	} */
	
	
</script>

<style>
.sstd{

      white-space:nowrap;overflow:hidden;text-overflow: ellipsis;

}
</style>

</head>

<body>
    <span class="printtitle"></span>
<div class="searchview">
  
  <form action="activity_feedback/index" method="post">
  
    <label class="searchtext">活动:</label>

     <select class="searchinput inputselect_long select" name="activity_id"  style="width:100px; height: 30px;"   onchange="selectchange(this);" >
         
         <c:forEach items="${requestScope.alist}" var="r" varStatus="v" >
         
         <c:if test="${requestScope.activity_id!=r.id}" >
         <option  value="${r.id}" style="width:100px; height:30px"  >${r.name} </option>
         </c:if>
         
         <c:if test="${requestScope.activity_id==r.id}" >
         
         <option  value="${r.id}" selected="selected" style="width:100px; height:30px"  >${r.name} </option>
         </c:if>
         
         </c:forEach>
          
         </select>
 <select class="searchinput inputselect_long select2" name="date"  style="width:100px; height: 30px;"    >
         
         <c:forEach items="${requestScope.datelist}" var="r" varStatus="v" >
         
         <c:if test="${requestScope.date!=r.date}" >
         <option  value="${r.date}" style="width:100px; height:30px"  >${r.date} </option>
         </c:if>
         
         <c:if test="${requestScope.date==r.date}" >
         
         <option  value="${r.date}" selected="selected" style="width:100px; height:30px"  >${r.date} </option>
         </c:if>
         
         </c:forEach>
          
         </select>
   
          <button class="seachbt" type="submit" >查询</button>
    
      </form>
    
        </div>
    
    <table class="tablelist" class="table-layout:fixed;">
    	<thead>
    	<tr>
       
       
        <th width="10%">学生</th>
 
        <c:forEach items="${requestScope.optquestions}" var="r"  >
        
        <th width="10%">${r}</th>
        
        </c:forEach>
        <c:forEach items="${requestScope.textquestions}" var="r"  >
        
        <th width="10%">${r}</th>
        
        </c:forEach>
        
        <th width="8%">导师回应</th> 
        <th width="10%">状态</th>          
         <th width="8%">操作</th>       
      
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
       
        
        <tr> 
        
         <td class="bigtext">${row.user_name}</td>
       
     <%--      <c:forEach items="${requestScope.optquestions}" var="r"  varStatus="v"  >
          
          <c:forEach items="${requestScope.optanswers}" var="r2"  varStatus="v2"  >
         <c:if test="${v.index==1}">
         <c:if test="${v2.index==row.opt1}">
          <td class="bigtext">${r2}</td>
       </c:if>
         </c:if>
         </c:forEach>
         
       
        </c:forEach>
         --%>
        
          <c:forEach items="${requestScope.optanswers}" var="r2"  varStatus="v2"  >
        
         <c:if test="${v2.index==row.opt1}">
          <td class="bigtext">${r2}</td>
       </c:if>
     
         
         
         <c:if test="${v2.index==row.opt2}">
          <td class="bigtext">${r2}</td>
       </c:if>
       
       <c:if test="${v2.index==row.opt3}">
          <td class="bigtext">${r2}</td>
       </c:if>
     
         </c:forEach>
         
         
         <td  class="bigtext sstd">${row.text1}</td>
         
         <td  class="bigtext sstd">${row.text2}</td>
         
        
        <td class="bigtext">${row.result}</td>
        <c:if test="${row.status==0}">
        <td style="color: red;" class="bigtext">${row.statuses}</td>
        </c:if>
         <c:if test="${row.status==1}">
        <td style="" class="bigtext">${row.statuses}</td>
        </c:if>
        
        <td><a href="javascript:openresult(${row.id});" class="tablelink" >回应</a>
         <c:if test="${row.status==0}">
              <a href="javascript:statusshows(${row.id});" class="tablelink" >显示</a>
       </c:if>
      <c:if test="${row.status==1}">
              <a href="javascript:statushid(${row.id});" class="tablelink" >隐藏</a>
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