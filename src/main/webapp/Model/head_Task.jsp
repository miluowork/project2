<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="headview">    	
        <label class="headtitle">试题名称:</label>
        <label class="headtext">${requestScope.taskinfo.title}</label>
         <label class="headline">|</label> 
        <label class="headtitle">试题类型:</label>
        <label class="headtext">${requestScope.taskinfo.type_name}</label>
 		<label class="headline">|</label> 
        <label class="headtitle">评分标准:</label>
        <label class="headtext">${requestScope.taskinfo.criterion}</label>
 		<label class="headline">|</label> 
        <label class="headtitle">试题内容:</label>
        <label class="headtext">${requestScope.taskinfo.info}</label>
 		<label class="headline">|</label>         
        <label class="headtitle">备注:</label>
        <label class="headtext">${requestScope.taskinfo.comments}</label>
        <div class="headprint">打印本页</div>
</div>
    