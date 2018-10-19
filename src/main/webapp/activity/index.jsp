<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script>
</script>


<style>
	.myWidth4 {
			max-width: 70px;
			min-width: 70px;
	}
	.myelipTd {
			text-overflow: ellipsis;
			overflow: hidden;
			white-space: nowrap;
			box-sizing: content-box;
	}
	th,td{
    display inline-block
    overflow: hidden; 
    white-space: nowrap;
    text-align: center!important;
   }
  td>button{
      color: blue;
    background-color:transparent!important;
    
    }
</style>
<script type="text/javascript">
var index;
function fresh() {
	location.href ="activity/index?txts=${requestScope.info.txts}&txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=${requestScope.info.pageno}";
}
function sonfresh() {
	document.getElementById(index).contentWindow.fresh();
}
function returnobject(o) {
}
deletethis=function(id){
	var r=confirm("delt it?");
	if (r==true)
	  {
		$.ajax({ 
			url: "activity/delete",
            method:'post',
            data:{id:id},
            success:function(data){
            	 fresh();
            },
            error:function(data){
                alert("服务器繁忙");
            }  
        });
	  }
}              
openwin=function(){
	layer_show("增加","activity/add",700,500);
}
editwin=function(id){
	layer_show("编辑","activity/edit?id="+id,700,500);
}
function addstuwin(id){
	layer_show("用户信息","activity/adduser?activityid="+id,1000,420);
}
function summary(id){
	layer_show("总结","activity_summary/index?select=1&txt="+id,1200,420);
}
function evaluation(activity_id) {
	layer_show("学生测评","activity_evaluation/index?activity_id="+activity_id,1000,500);
}


shownewwin=function(title,data,choose){
  layer.open({
    		  type: 2,
    		  skin: 'layui-layer-rim', //加上边框
    		  area: ['420px', '240px'], //宽高
    		  content: "activity/"+choose+"?data="+data
       });
}
studentwin=function(id){
	layer.open({
		type: 2,
		  skin: 'layui-layer-rim', //加上边框
		  area: ['620px', '300px'], //宽高
		  content: "activity/student?id="+id
	});
}
manmessage=function(source_operator_id,operator_id,instructor_user_id,charge_operator_id){
	layer.open({
			type: 2,
		 	skin: 'layui-layer-rim', //加上边框
		  area: ['150px', '200px'], //宽高
		  content: "activity/select_json?id1="+source_operator_id+"&id2="+operator_id+"&id3="+instructor_user_id+"&id4="+charge_operator_id
	});	
}
selectonchange=(function(){
	if($(".select").val()==0){
		$(".selecttxts").prop("hidden","hidden");
		$(".selecttxts").removeProp("name");
		$(".type").removeProp("hidden");
		$(".type").prop("name","selecttxt");
	}else if($(".select").val()==2){
		$(".selecttxts").prop("hidden","hidden");
		$(".selecttxts").removeProp("name");
		$(".charge_operator_id").removeProp("hidden");
		$(".charge_operator_id").prop("name","selecttxt");
	}else if($(".select").val()==3){
		$(".selecttxts").prop("hidden","hidden");
		$(".selecttxts").removeProp("name");
		$(".source_operator_id").removeProp("hidden");
		$(".source_operator_id").prop("name","selecttxt");
	}else if($(".select").val()==4){
		$(".selecttxts").prop("hidden","hidden");
		$(".selecttxts").removeProp("name");
		$(".status").removeProp("hidden");
		$(".status").prop("name","selecttxt");
	}else{
		$(".selecttxts").prop("hidden","hidden");
		$(".selecttxts").removeProp("name");
		$(".txt").removeProp("hidden");
		$(".txt").prop("name","txt");
	}
});
$(function(){
	selectonchange();
})
$(function(){
			var o = $(".selectinfo");
			$(o).each(function() {
				selectinfo(this);
			});
});
selectinfo = function(o) {
			$.ajax({
				url : "activity_operator/index_json",
				type : "post",
				data : {
					where : $(o).attr("term")
				},
				dataType : "json",
				success : function(json) {
					for (var i = 0; i < json.length; i++) {
						if (json[i].id == $(o).attr("val")) {
							$(o).append(
									"<option value='"+json[i].id+"' selected='selected'>"
											+ json[i].name + "</option>");
						} else {
							$(o).append(
									"<option value='"+json[i].id+"'>"
											+ json[i].name + "</option>");
						}
					}
				}
			});
		}
showtips=function(text,idclass){
	layer.tips(text, idclass, {
		  tips: 3
		});
}
timelist=function(id){
	layer.open({
		type: 2,
		  skin: 'layui-layer-rim', //加上边框
		  area: ['720px', '350px'], //宽高
		  content: "activity/student?id="+id
	});
}

hidetxts=function(){
	var o=$(".date");
	o.val("");
}
</script>
<body>
   <span class="printtitle"></span>
     <form action="activity/index" method="post" >
       <div class="searchview">
       <label class="searchtext"><b>查询方式：</b></label>
        <select class="select searchinput inputselect_long" name="select" onchange="selectonchange();" style="width: 80px">
        <c:forEach items="${requestScope.selectarray}" var="s" varStatus="ss">
        	<c:if test="${ss.index==info.select}">
        	<option value="${ss.index}" selected="selected">${s}</option>
        	</c:if>
        	<c:if test="${ss.index!=info.select}">
        	<option value="${ss.index}" >${s}</option>
        	</c:if>
       	</c:forEach>
        </select>
        
         <input class="searchinput txt selecttxts" name="txt" style="width: 180px" value="${requestScope.info.txt}"/>
         
         <select name="selecttxt" class="selecttxts type searchinput inputselect_long">
         	<c:forEach items="${requestScope.types}" var="t" varStatus="ts">
         	<c:if test="${info.selecttxt==ts.index}">
         		<option selected="selected" value="${ts.index}">${t}</option>
         	</c:if>
         	<c:if test="${info.selecttxt!=ts.index}">
         		<option value="${ts.index}">${t}</option>
         	</c:if>
         	</c:forEach>
         </select> 
         
         <select name="selecttxt" class="selecttxts status searchinput inputselect_long">
         	<c:forEach items="${requestScope.status}" var="t" varStatus="ts">
         	<c:if test="${info.selecttxt==ts.index}">
         		<option selected="selected" value="${ts.index}">${t}</option>
         	</c:if>
         	<c:if test="${info.selecttxt!=ts.index}">
         		<option value="${ts.index}">${t}</option>
         	</c:if>
         	</c:forEach>
         </select>
          	<select name="selecttxt" class="selectinfo selecttxts charge_operator_id searchinput inputselect_long" term="where type=1" style="width: 180px"
		val="${info.selecttxt}"></select><!-- 负责人 -->
			<select name="selecttxt" class="selectinfo selecttxts source_operator_id searchinput inputselect_long" term=" " style="width: 180px"
		val="${info.selecttxt}"></select><!-- 发起人 -->
        
        <button class="seachbt search" type="submit">查询</button>
        <button class="seachbt" onclick="openwin();" type="button">新增</button>
         <input value="清空日期"  class="seachbt hidetxts" type="button" onclick="hidetxts()" style="margin-top:5px;float: right;margin-right: 10px">
      	<input name="txts" class="laydate-icon date span1-1 inputinput" id="Calendar1" value="${requestScope.info.txts}" style="margin-top:4px;float: right;margin-right: 10px;">
      	
      	
       </div>
        </form>
        
    <table class="tablelist" style="table-layout: fixed;">
    	<thead>
    	<tr>
    	<th width="30px"><input type="checkbox"></th>
        <th width="110px">活动名称</th>
        <th width="70px">时间信息</th>	
          <th width="100px">学校</th>
        <th width="100px">专业</th>
        <th width="70px">课程信息</th> 
        <th width="70px">计划信息</th> 
<!--         <th width="70px">人数</th> 
        <th width="70px">班级数量</th> -->
        <th width="70px">人员信息</th><!-- 发起，添加，负责 --> 
        <th width="70px">道具选项</th> 
        <th width="70px"  class="myWidth4 myelipTd" >注意事项</th>
        <th width="70px">活动类型</th>  
        <th width="210px">操作</th> 
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
 <tr class="tr">
 		<td class="chk" thisid="${row.id}"><input type="checkbox"></td>
        <td>${row.name}</td>
        <td class="myWidth4 myelipTd" onmouseenter="showtips('${row.dateinfo}',this)" >${row.dateinfo}</td>
        <td  style="overflow: ellipsis">${row.school}</td>
        <td  style="overflow: ellipsis">${row.college}</td>
        <td class="myWidth4 myelipTd" onmouseenter="showtips('${row.courseinfo}',this)">${row.courseinfo}</td>
        <td class="myWidth4 myelipTd" onmouseenter="showtips('${row.planinfo}',this)">${row.planinfo}</td>
        <%-- <td><button onclick="studentwin('${row.id}')">${row.count}</button></td>
        <td>${row.classcount}</td>  --%>
        <td><button style="clear: both" onclick="manmessage('${row.source_operator_id}','${row.operator_id}','${row.instructor_user_id}','${row.charge_operator_id}')">详情</button></td>
        <td><button onclick="shownewwin('道具','${row.options}','toolchoose')">道具选项</button></td>
        <td class="myWidth4 myelipTd" onmouseenter="showtips('${row.attention}',this)">${row.attention}</td>
        <td>${requestScope.types[row.type]}</td>
        <td>
        <a href="javascript:void(0);" class="tablelink ufdy" onclick="editwin(${row.id});">修改</a>
        <a href="javascript:void(0);" class="tablelink ufdy" onclick="deletethis('${row.id}');">删除</a>
        <a href="javascript:void(0);" class="tablelink" onclick="studentwin('${row.id}');">查看学生</a>
        <a href="javascript:void(0);" class="tablelink" onclick="summary(${row.id});">总结</a>
        <a href="javascript:void(0);" class="tablelink" onclick="evaluation('${row.id}');">测评</a>
        </td>
        </tr>  
  </c:forEach>
        </tbody>
    </table>
    <div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.max}</i>条记录，共${requestScope.info.maxPage}页，当前显示第&nbsp;
    	<i class="blue">${requestScope.info.pageno}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="activity/index?txts=${requestScope.info.txts}&txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=1">首页</a></li>
        <li class="paginItem"><a href="activity/index?txts=${requestScope.info.txts}&txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=${requestScope.info.prev}">上一页</a></li>
        <li class="paginItem"><a href="activity/index?txts=${requestScope.info.txts}&txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=${requestScope.info.next}">下一页</a></li>
        <li class="paginItem"><a href="activity/index?txts=${requestScope.info.txts}&txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=${requestScope.info.maxPage}">末页</a></li> 
        </ul>
    </div>
<c:import url="/Model/list_footer.jsp" ></c:import>
<script type="text/javascript">
$(function(){
	tp();
})
function tp(){
	var type=${sessionScope.user.type==null?0:sessionScope.user.type};
	if(type==1){//辅导员
		$(".ufdy").css("display","none");
	}
};
</script>
</body>