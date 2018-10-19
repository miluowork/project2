<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="headview">    	
    	<label class="headtitle">班级:</label>    	
        <label class="headtext">${requestScope.classinfo.name}</label> 
        <label class="headline">|</label> 
        <label class="headtitle">课程阶段:</label>    	
        <label class="headtext">${requestScope.modeinfo.stageInfo}</label> 
        <label class="headline">|</label> 
        <label class="headtitle">数量:</label>    	
        <label class="headtext">${requestScope.count}</label>  
        <div class="headprint">打印本页</div> 
</div>