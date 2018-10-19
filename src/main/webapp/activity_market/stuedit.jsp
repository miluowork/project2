<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
<head>
<style type="text/css">
	.inputspan1{
		height: 70px;
	}
	td{
		text-align: center;
	}
	.inputinput{
	width: 300px;
	}.level{
	width: 30px;
	padding-left: 10px;
	}
</style>
</head>

<body style="min-width: 100px;">
	<script>
	$(function(){
		var json=$(".jsonjudge").val();
		if (json==0) {
			var test=${requestScope.info.activity_id!=null?requestScope.info.activity_id:0};
			getids(test);
		}else{ 
			var test2=${requestScope.info.id!=null?requestScope.info.id:0}
			editjson(test2);
		}
	});
			getids=function(id){//获取第一次调用
			var o=$(".tb");
			o.children().remove();
			  $.post("activity_market/get_json",{"aid":id},function(json){for(var i=0;i<json.length;i++){
					var obj = eval(json[i]);
					o.append("<tr class='tr'><td>"+obj.name+"</td>"+
							"<td><select><option>A</option><option>B</option><option>C</option><option>D</option><option>E</option><option>F</option></select></td><td><input class='daywrite inputinput' value='暂无事件'/></td></tr>");
				}});
		}			
		editjson=function(id){
			var o=$(".tb");
			o.children().remove();
			var student;
			$.post("activity_market/editjson_json",{"id":id},function(data){
				var json=JSON.parse(data);
					for(var i=0;i<json.length;i++){
					student = json[i];
					o.append("<tr class='tr'><td>"+student.name+"</td>"+
							"<td><select class='selector'><option>A</option><option>B</option><option>C</option><option>D</option><option>E</option><option>F</option></select></td><td><input class='daywrite inputinput' value='"+student.daywrite+"'/></td></tr>");
					}
					$(".selector").each(function(i){
						$(this).find("option:contains('"+json[i].level+"')").attr("selected",true);
					})
			});
		}
		editinjson=function(){//存储时调用
			var o=$(".tr");
			var arr=new Array();
			o.each(function(){
				o.attr("daywrite",$(this).find(".daywrite:first").val());
				var student=new Object();
				student.name=$(this).find("td:first").text();
				student.level=$(this).find("select").val();
				student.daywrite=$(this).attr("daywrite");
				arr.push(student);
			});
			$.ajax(
					{ 
						url: "activity_market/save_json",
						data:{"arr":JSON.stringify(arr)},
						dataType:'text',
				});
		} 
	</script>
	<script type="text/javascript">
			function edit() {
				editinjson();
				var data = $(".f1").serialize();
				$.ajax({
					url : $(".f1").attr("action"),
					type : "post",
					data : data,
					dataType : "json",
					success : function(json) {
						if (json.status > 0) {
							 parent.fresh();  
							layer_close();
						}
					}
				});
			}
		</script>
<form class="f1" action="activity_market/update_json">
	<input name="id" hidden="hidden" value="${requestScope.info.id}">
	<input name="activity_id" hidden="hidden" value="${requestScope.info.activity_id}">
	<input name="operator_id" hidden="hidden" value="${requestScope.info.operator_id}">
	<input name="info" hidden="hidden" value="${requestScope.info.info}">
	<input name="date" hidden="hidden" value="${requestScope.info.date}">
	<input name="comments" hidden="hidden" value="${requestScope.info.comments}">
	</form>
	<input class="inputinput jsonjudge" name="json" type="text" style="display:none;"  value="${requestScope.info.json=='1'?0:1}" />
	<div style="width: 400px; display: block; float: left;" class="stuprog">
		<table>
			<thead>
				<tr>
					<th width="300px">姓名</th>
					<th width="300px">关注等级</th>
					<th width="300px">信息</th>
				</tr>
			</thead>
			<tbody class="tb">
				<tr class="tr"></tr>
			</tbody>
		</table>
	</div>
	<br>
	<div class="inputbtpanel" style="top: auto;">
		<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
		<button class="seachbt1" type="button" onclick="edit();">保存</button>
	</div>
	<c:import url="/Model/form_footer.jsp"></c:import>
</body>