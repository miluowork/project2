<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>示例登陆页</title>
    
     <link href="./css/login.css" rel="stylesheet">
    
    <script type="text/javascript" src="js/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/situ.js"></script>
    <script type="text/javascript" src="js/layer/layer.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <script type="text/javascript">
    
    var a=0;
    
    function fresh(){
    	location.href="index.jsp";
    }
    
    function ologin() {
    	
    	$.post("ologin",$(".f1").serialize(),function(json){
    		if(json.status>0){
    			location.href="index.jsp";
    		
    		}else{
    			
    			alert(${sessionScope.error});
    			location.href="login.jsp";
    		}
    			
    	},"json");
		
	}
    
    
   function ulogin() {
    	
    	$.post("ulogin",$(".f1").serialize(),function(json){
    		if(json.status>0){
    			location.href="index.jsp";
    		
    		}else{
    			
    			alert(${sessionScope.error});
    			location.href="login.jsp";
    		}
    			
    	},"json");
		
	}
    

	function setTab(m, n) {

		var tli = document.getElementById("menu" + m)
				.getElementsByTagName("li");

		var mli = document.getElementById("main" + m)
				.getElementsByTagName("ul");

		for (i = 0; i < tli.length; i++) {

			tli[i].className = i == n ? "hover" : "";

			mli[i].style.display = i == n ? "block" : "none";

		}

	}

 </script>
    
    <style type="text/css">
    
       #win10-login {
            background: url('./img/wallpapers/login.jpg') no-repeat fixed;
            width: 100%;
            height: 100%;
            background-size: 100% 100%;
            position: fixed;
            z-index: -1;
            top: 0;
            left: 0;
        }
        
    </style>
    
   
</head>
<body>
<div id="win10-login">
    <div style="height: 10%;min-height: 120px"></div>
    <div id="win10-login-box">
        <div class="win10-login-box-square">
            <img src="./img/avatar.jpg" class="content"/>
        </div>
        
         <form  class="f1" method="post" action="#">
        
       	<ul class="menu0" id="menu0">
					<li onclick="setTab(0,0)" class="hover">甲方登录</li>
					<li onclick="setTab(0,1)">乙方登录</li>
					
				</ul>
				
				
  <br>
       <br>
       <br>
       
       
        
       
        
       
            <!--用户名-->
            <input type="text" name="username" placeholder="请输入登录名" class="login-username">
              <!--用户名-->
            <input type="password" name="password" placeholder="请输入密码" class="login-password">
            
            <!--密码-->
          
            
             <span>
                  <input type="text" name="rcode" placeholder="请输入验证码" class="login-rcode">
                <img  src="rcode/img"   onclick="src='rcode/img?a='+(a++)" height="33px" >
                </span>
            <!--登陆按钮-->
            <br>
            
            <div class="main" id="main0">
						
					<ul class="block">
						<li>
						<div class="inputview1">
				
							  <input type="button"  value="甲方登录" id="btn-login1" class="login-submit" onclick="ulogin();" />
							</div>
					</li>
					</ul>
					
					
					
				<ul>
					<li><div class="inputview1">
					  <input type="button"  value="乙方登录" id="btn-login" class="login-submit" onclick="ologin();" />
 							
						</div>
					</li>
				</ul>
			
			
			</div>
          
        </form>
    </div>
</div>
</body>
</html>