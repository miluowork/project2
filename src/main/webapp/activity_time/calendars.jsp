<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
  <style>
   .inputspan1{
     margin-left: 50px
   }
   .inputspan{
     margin-left: 70px
   }
 </style>

</head>

<body style="min-width:100px;">
	<script>
	
	var ctx = "${ctx}";
	$(function(){
	windowInit();
	});
	function windowInit(){
	        
	        var today = new Date();
	        var year = today.getFullYear();
	        var month = today.getMonth()+1;
	        document.getElementById("year").value = year;
	        document.getElementById("month").value = month;
	        
	        showCalender();
	    }
	    
	    function showCalender(){
	        var year = document.getElementById("year").value;
	        var month = document.getElementById("month").value;
	       
	        myCalender(year,month,"cla");
	    }


	   function myCalender(year,month,tbId){
	var oTable = document.getElementById(tbId);//取得table
	 var oTBody = oTable.tBodies[1];
	var row_length = oTBody.rows.length;
	 for(var rows = 0 ; rows < row_length; rows ++){


	     oTBody.deleteRow(0);
	 }
	 var crrentDay = new Date();
	 crrentDay.setYear(year);
	 crrentDay.setMonth(month);
	 var maxIndex = new Date(crrentDay.getFullYear(),crrentDay.getMonth(),0).getDate();


	 var firstIndex = new Date(crrentDay.getFullYear(),crrentDay.getMonth()-1,1).getDay();
	 if(firstIndex==0){
	firstIndex=6;
	 }else{
	firstIndex-=1;
	 }


	 var days = new Array(42);
	 
	 for(var d = 0 ; d < maxIndex ; d ++){
	     days[firstIndex+d] = d+1;
	 }
	 
	 for(var d = 0 ; d < 42 ; d ++){
	     if(days[d] == null || days[d] == ""){
	         days[d] = "&nbsp;";
	     }
	 }
	 for(var j=0; j<6 ; j++) { 
	    var newTr = document.createElement("TR");
	    for(var i=j*7 ; i< (j+1)*7 ;i++) { 
	        var newTd = document.createElement("TD");
	        if(days[i] == "&nbsp;"){
	            newTd.innerHTML = days[i];
	        }else{
	            var v_date = year+"-"+month+"-"+days[i];
	            newTd.innerHTML = "<font size='5' style='color: #149ac1;cursor:pointer'>"+days[i]+"</font>";
	        }
	        
	        newTd.setAttribute("width","100px");
	        newTd.setAttribute("height","80px");
	        newTr.appendChild(newTd);
	    }
	    oTBody.appendChild(newTr); 
	}
	}
	
	</script>
   
   
   <table width="400px"   border="0" cellspacing="0" cellpadding="0"
                style="margin: 0 auto; margin-top: 5px">
                <tr>
                    <td valign="top" style="padding-right: 5px; padding-bottom: 10px">
                        
                        <table width="100%" border="0" cellspacing="0" cellpadding="0"
                            style="border: 1px solid #e8e8e8; border-top: 0;">
                            
                            <tr>
                                <td style="padding: 15px; padding-top: 0">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0"
                                        class="black12_18 tab_line" id="cla">
                                        <tr>
                                            <td colspan="7" align="center" height="50">
                                                <select id="year" onchange="showCalender();">
                                                    <option value="2018">2018</option>
                                                    <option value="2019">2019</option>
                                                    <option value="2020">2020</option>
                                                    <option value="2021">2021</option>
                                                    <option value="2022">2022</option>
                                                    <option value="2023">2023</option>
                                                    <option value="2024">2024</option>
                                                </select>&nbsp;年&nbsp;
                                                <select id="month" onchange="showCalender();">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                    <option value="12">12</option>
                                                </select>&nbsp;月&nbsp;&nbsp;
                                               
                                            </td>
                                        </tr>
                                        <tr>
                                        
                                            <th width="100px" height="60px">
                                                <font size="size="5">一</font>
                                            </th>
                                            <th width="100px" height="60px">
                                                <font size="size="5">二</font>
                                            </th>
                                            <th width="100px" height="60px">
                                                <font size="size="5">三</font>
                                            </th>
                                            <th width="100px" height="60px">
                                                <font size="size="5">四</font>
                                            </th>
                                            <th width="100px" height="60px">
                                                <font size="size="5">五</font>
                                            </th>
                                            <th width="100px" height="60px">
                                                <font color="red" size="5">六</font>
                                            </th>
                                            <th width="100px" height="60px">
                                                <font color="red" size="5">日</font>
                                            </th>
                                        </tr>
                                        <TBODY align="center">
                                            
                                        </TBODY>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
 
   
	

  <c:import url="/Model/form_footer.jsp" ></c:import>
  </body>