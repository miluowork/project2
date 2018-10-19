<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script>
  var txt1=${requestScope.txt1};
  var txt='${requestScope.txt}';
  
  
	function fresh(){
		location.href="activity_checkwork/index?txt1="+txt1+"&txt="+txt;
	};
	function openedit(id){
	layer_show("考勤信息","activity_checkwork/edit?id="+id,700,370);
	}
	
	

function quickCheck(o){
	var activity_id=$(".sele").val();
	var date=$(".text_add").val();
	var code=$(o).val();
	 layer.confirm('确认要快捷考勤？',function(){ 
			$.ajax({
				url :"activity_checkwork/quickCheck",
				type : "post",
				data : {
					activity_id:activity_id,
					date:date,
					code:code
				},
				dataType : "json",
				success : function(json) {
					if (json.status > 0) {
					fresh();
					}
				 }
			  });
    }); 
};




$(function(){
	$(".sele").val(txt1);
	$(".text_add").val(txt);
});

function allChange(){
	var ids="";
	
	$(".chk:checked").each(function(i){
		ids +=$(".chk:checked").eq(i).val()+",";
	});
	ids=ids.substring(0,ids.length-1);
	layer_show("考勤信息","activity_checkwork/edit?ids="+ids+"&id=1",700,370);
};

function resetCheck(){
	var activity_id=$(".sele").val();
	var date=$(".text_add").val();
	 layer.confirm('确认要快捷考勤？',function(){ 
			$.ajax({
				url :"activity_checkwork/resetCheck",
				type : "post",
				data : {
					activity_id:activity_id,
					date:date,
				},
				dataType : "json",
				success : function(json) {
					if (json.status > 0) {
					fresh();
					}
				 }
			  });
    }); 
};

function resetPerson(id){
	 layer.confirm('确认重置考勤?',function(){ 
			$.ajax({
				url :"activity_checkwork/resetPerson",
				type : "post",
				data : {
					id:id
				},
				dataType : "json",
				success : function(json) {
					if (json.status > 0) {
					fresh();
					}
				 }
			  });
   });
	}
</script>

<script>

</script>
<style>
td,th{
text-align: center !important;
}
.sele {
width:150px;
}

</style>
</head>


<body>
   <span class="printtitle"></span>
     
     <form  id="form" action="activity_checkwork/index" method="post">
       <div class="searchview">
        <label style="font-size:13px;font-weight: bold;">当前活动:</label>
        
        <select name="txt1" class="sele inputselect sinput searchinput inputselect_long" style="height:30px">
			<c:forEach items="${requestScope.aList}" var="r" varStatus="v">
					<option value="${r.id}">${r.name}</option>
			</c:forEach>
       </select>
       
       <input name="txt"  class="laydate-icon  span1-1 inputinput sinput text_add" id="Calendar1"   style=" width:218px;"/>
		        <button class="seachbt" type="submit">查询</button>
		        <button class="seachbt" onclick="allChange();" type="button">批量修改</button>
		        <button class="seachbt" onclick="resetCheck();" type="button" style="width:85px">重置今日考勤</button>
       </div>
        </form>
        
    <table class="tablelist" style="table-layout: fixed;">
    	<thead>
    	<tr>
    	<th width="10%"><input type="checkbox"/></th>
        <th width="10%">活动</th>
        <th width="10%">姓名</th>
        <th width="10%">日期</th>
        <th width="8%">早上
        &nbsp; 
        <button onclick="quickCheck(this)" class="chks"  value="1">
                          考勤
        </button>
        </th>
        <th width="8%">中午
        &nbsp;
        <button onclick="quickCheck(this)" class="chks"  value="2">
                          考勤
        </button>
        </th>
        <th width="8%">晚上
        &nbsp;
        <button onclick="quickCheck(this)" class="chks"  value="3">
                           考勤 
        </button>
        </th>
        <th width="10%">备注</th>  
        <th width="16%">操作</th>
        </tr>
        </thead>
        
        <tbody>
     
        <c:forEach items="${requestScope.ckList}" var="row" >
 <tr>
        <td><input class="chk" type="checkbox" value="${row.id}"/></td>
        <td>${row.activityName}</td>
        <td>${row.userName}</td>
        <td>${row.date}</td>
        <td>${requestScope.check[row.check1]}</td>
        <td>${requestScope.check[row.check2]}</td>
        <td>${requestScope.check[row.check3]}</td>
        <td>${row.comments}</td>
        <td>
        <a href="javascript:openedit(${row.id});" class="tablelink" >修改</a>
        <a href="javascript:resetPerson(${row.id});" class="tablelink" >重置考勤</a>
        </td>
        </tr>  
  </c:forEach>
       
       
        </tbody>
    </table>
    
<c:import url="/Model/list_footer.jsp" ></c:import>

