<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script>
</script>
<head>

</head>
<script type="text/javascript">
</script> 
<script type="text/javascript">
function fresh() {
	location.href = "activity_report/index?txts=${requestScope.info.txts}&txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=${requestScope.info.pageno}";
}
deletethis=function(id){
	var r=confirm("delt it?");
	if (r==true)
	  {
	$.ajax({ 
			url: "activity_report/delete",
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

</script>
<script type="text/javascript">
selectonchange=(function(){
	if($(".select").val()==0){
		$(".txt").prop("hidden","hidden");
		$(".txt").removeProp("name");
		$(".selecttxt").prop("hidden","hidden");
		$(".selecttxt").removeProp("name");
		$(".activity").removeProp("hidden");
		$(".activity").prop("name","selecttxt");
	}else{//内容
		$(".txt").removeProp("hidden");
		$(".txt").prop("name","txt");
		$(".selecttxt").prop("hidden","hidden");
		$(".selecttxt").removeProp("name");
	}
});
$(function(){
	selectonchange();
});
$(function() {
			var o = $(".selectinfo");
			$(o).each(function() {
				selectinfo(this,$(this).attr("tx"));
			});
});
selectinfo = function(o,text) {
			$.ajax({
				url : text,
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
		
openwin=function(){
	layer_show("增加","activity_report/add",1000,400);
}
editwin=function(id){
	layer_show("编辑","activity_report/edit?id="+id,1000,400);
}
editstuwin=function(id){
	layer_show("编辑","activity_report/editstu?id="+id,600,400);
}
</script> 
<body>
   <span class="printtitle"></span>
     <form action="activity_report/index" method="post" name="f1">
       <div class="searchview">
       <input name="txts" class="laydate-icon  span1-1 inputinput" id="Calendar1">
       	<label class="searchtext"><b>日报查询：</b></label>
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
       
        <input class="searchinput txt" name="txt" style="width: 180px" value="${requestScope.info.txt}"/>
		<select name="selecttxt" class="selectinfo selecttxt activity searchinput inputselect_long" term="where status=1" tx="activity/index_json" style="width: 180px"
		val="${info.selecttxt}"><option value="0" selected="selected">未选中</option></select><!-- 活动 -->
		<input hidden="hidden" name="operator_id" value="${sessionScope.userid==null?1:sessionScope.userid}"/>
      <button class="seachbt search" type="submit">查询</button>
         <button class="seachbt" onclick="openwin();" type="button">新增</button>
         	
       </div>
        </form>
    <table class="tablelist">
    	<thead>
    	<tr>
    	<th width="5%"></th>
        <th width="10%">活动</th>
        <th width="10%">日期</th>
        <th width="10%">教师情况</th>
        <th width="10%">学生情况</th>
        <th width="10%">课程情况</th>
        <th width="15%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
 <tr class="tr">	
 		<td  class="chk" thisid="${row.id}"><input type="checkbox"></td>
        <td>${row.activity_id}</td>
        <td>${row.date}</td>
        <td>${row.tprogress}</td>
        <td>${row.sprogress}</td>
        <td>${row.cprogress}</td>
        <td>
        <a href="javascript:void(0);" class="tablelink" onclick="editwin(${row.id});">修改</a>
        <a href="javascript:void(0);" class="tablelink" onclick="editstuwin(${row.id});">修改学生</a>
        <a href="javascript:void(0);" class="tablelink" onclick="deletethis('${row.id}');">删除</a>
        </tr>  
  </c:forEach>
        </tbody>
    </table>
<div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.max}</i>条记录，共${requestScope.info.maxPage}页，当前显示第&nbsp;
    	<i class="blue">${requestScope.info.pageno}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="activity_report/index?txts=${requestScope.info.txts}&txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=1">首页</a></li>
        <li class="paginItem"><a href="activity_report/index?txts=${requestScope.info.txts}&txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=${requestScope.info.prev}">上一页</a></li>
        <li class="paginItem"><a href="activity_report/index?txts=${requestScope.info.txts}&txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=${requestScope.info.next}">下一页</a></li>
        <li class="paginItem"><a href="activity_report/index?txts=${requestScope.info.txts}&txt=${requestScope.info.txt}&selecttxt=${requestScope.info.selecttxt}&select=${requestScope.info.select}&pageno=${requestScope.info.maxPage}">末页</a></li>
        </ul>
      
    </div>
<c:import url="/Model/list_footer.jsp" ></c:import>
 
</body>
