<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="headview" style="line-height: 35px;">
	<label class="headtitle">班级:</label> 
	<label class="headtext">${requestScope.classinfo.name}</label>
	<label class="headline">|</label> 
	<label class="headtitle">讲师:</label> 
	<label class="headtext">${requestScope.classinfo.operator_lecturer_name}</label>
	<label class="headline">|</label> 
	<label class="headtitle">总人数:</label> 
	<label class="headtext">${requestScope.classinfo.studentCount}</label>
	<c:if test='${requestScope.data=="file"}'>
	<label class="headline">|</label> 
	<label class="headtitle" style="color:#fff;">数据文件:</label> 
	<label class="headtext filepath" style="color:#ff0;">
	<c:if test="${sessionScope.allpath!=null}">${sessionScope.allpath}</c:if>
	<c:if test="${sessionScope.allpath==null}">未指定</c:if>
	
	
	</label>
	</c:if>
	<label class="headinfo"></label>
	<div class="headprint" style="    width: 90px;">打印本页</div>
</div>