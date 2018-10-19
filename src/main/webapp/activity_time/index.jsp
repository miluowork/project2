<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script  type="text/javascript"   src="js/H-ui.admin.js"></script>
<script>
function fresh() {
		location.href = "activity_time/index";
	}
	function returnobject(o) {

	}
		
	
function openwin(){
	var activity_id=$(".select option:selected").val(); 
	layer_show("增加","activity_time/add?activity_id="+activity_id,650,450);
	}
	function openedit(id){
		var activity_id=$(".select option:selected").val(); 
	layer_show("修改","activity_time/edit?id="+id,650,450);
	}
	
	function openfeedback(activity_id) {
	
		var date= $(".feedback").attr("date");
		layer_show("学生反馈","activity_feedback/index?date="+date+"&activity_id="+activity_id,1000,500);
		
	}
	
	function checkwork(activity_id) {
		var date= $(".feedback").attr("date");
		layer_show("考勤","activity_checkwork/index?txt="+date+"&txt1="+activity_id,1000,450);
		
	}
	
	function report(activity_id) {
		var date= $(".feedback").attr("date");
		layer_show("讲师日报","activity_report/index?date="+date+"&activity_id="+activity_id,1000,500);
	}
	
	function openinfo() {
		
		var activity_id=$(".select option:selected").val(); 
		layer_show("时间详情","activity_time/edit?id="+id,650,450);
		
		
	}
	
	function openmarket(id) {
		var date= $(".feedback").attr("date");
		layer_show("市场活动","activity_market/index?select="+0+"&selecttxt="+id+"&txts="+date,800,450);
	}
	
	

	
</script>

</head>

<body>
    <span class="printtitle"></span>
<div class="searchview">
     <form action="activity_time/index" method="post">
     <label class="searchtext">活动:</label>
     	
       <select class="searchinput inputselect_long select" name="activity_id"  style="width:150px; height: 30px;"    >
         
         <c:forEach items="${requestScope.alist}" var="r" varStatus="v" >
         
         <c:if test="${requestScope.activity_id!=r.id}" >
         <option  value="${r.id}" style="width:100px; height:30px"  >${r.name} </option>
         </c:if>
         
         <c:if test="${requestScope.activity_id==r.id}" >
         
         <option  value="${r.id}" selected="selected" style="width:100px; height:30px"  >${r.name} </option>
         </c:if>
         
         </c:forEach>
          
         </select>
               
        <button class="seachbt" type="submit">查询</button>
        
      <!--   <button class="seachbt1  " type="button" onclick="allseach('Company_seach','Entrance_Company/index');">自定义查询</button> -->
     <button class="seachbt" type="button" onclick="openwin();">新增</button> 
         
        </form>
        </div>
    
    <table class="tablelist" class="table-layout:fixed;">
    	<thead>
    	<tr>
        <th width="10%">活动名称</th>
        <th width="10%">日期</th>
        <th width="7%">上午上课</th>
        <th width="7%">上午下课</th>
        <th width="7%">下午上课</th>
        <th width="7%">下午下课</th>
        <th width="7%">晚上上课</th>
        <th width="7%">晚上下课</th>
        <th  width="10%">地点信息</th>
        <th width="6%">讲师</th>
        <th width="7%">状态</th>
        <th  width="10%">备注</th> 
        <th width="18%">操作</th>
        </tr>
        </thead>
        
        <tbody>
  
        <c:forEach items="${requestScope.list}" var="row" >
        <tr>
        <td class="bigtext">${row.name}</td>
        <td class="bigtext">${row.date}</td>
        <td class="bigtext">${row.time1}</td>
        <td class="bigtext">${row.time2}</td>
        <td class="bigtext">${row.time3}</td>
        <td class="bigtext">${row.time4}</td>
        <td class="bigtext">${row.time5}</td>
        <td class="bigtext">${row.time6}</td>
        <td >${row.roominfo}</td>
        <td>${row.oname}</td>
        <td>	
				<c:forEach items="${requestScope.statuses}" var="r" varStatus="v" >
						 
				<c:if test="${row.status==v.index}">
                      ${r}
                  </c:if>
      	
					</c:forEach>
						
			</td>
			
        <td class="bigtext">${row.comments}</td>
        
       
        <td>
        <a href="javascript:openfeedback(${row.activity_id});" class="tablelink feedback" date="${row.date}" >反馈信息</a>
        <c:if test="${sessionScope.type==2}">
         <a href="javascript:openmarket(${row.activity_id});" class="tablelink" >市场活动</a>
         </c:if>
        <a href="javascript:openedit(${row.id});" class="tablelink" >修改</a>        
         <a href="javascript:checkwork(${row.activity_id});" class="tablelink" >考勤</a>
          <c:if test="${sessionScope.type==1}">
         <a href="javascript:report(${row.activity_id});" class="tablelink" >日报</a>
          </c:if>
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