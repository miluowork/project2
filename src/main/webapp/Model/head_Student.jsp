<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="headview">    	
    	<label class="headtitle">班级:</label>    	
        <label class="headtext">${requestScope.classinfo.name}</label> 
        <label class="headline">|</label> 
        <label class="headtitle">课程:</label>    	
        <label class="headtext">${requestScope.classinfo.course_name}</label> 
        <label class="headline">|</label> 
        <label class="headtitle">讲师:</label>    	
        <label class="headtext">${requestScope.classinfo.operator_lecturer_name}</label>   
        <label class="headline">|</label>    
        <label class="headtitle">学生名称:</label>
        <label class="headtext">${requestScope.studentinfo.name}</label>
        <label class="headline">|</label> 
        <label class="headtitle">学生电话:</label>
        <label class="headtext">${requestScope.studentinfo.tel}</label>
        <div class="headprint">打印本页</div>
</div>