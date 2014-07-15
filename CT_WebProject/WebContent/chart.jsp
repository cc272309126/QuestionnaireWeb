<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>统计</title>
	<link rel="stylesheet" href="css/common.css"/>
    <%@include file="head.jsp" %>
   <style type="text/css">


   </style>

     </head>

  <body>

    <%@ include file="header.jsp" %>
 	<div id="wrapper" style="padding-top:51px;padding-left:10%;padding-right:10%;">
	</div>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/Chart.js"></script>
	<script type="text/javascript" language="javascript">
	var randomScalingFactor = function(){ return Math.round(Math.random()*100);};

	var barChartData = {
		labels : ["January","February","March","April","May","June","July"],
		datasets : [
			
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,0.8)",
				highlightFill : "rgba(151,187,205,0.75)",
				highlightStroke : "rgba(151,187,205,1)",
				data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
			}
		]

	}	;
	
	var pieData = [
					{
						value: 300,
						color:"#F7464A",
						highlight: "#FF5A5E",
						label: "Red"
					},
					{
						value: 50,
						color: "#46BFBD",
						highlight: "#5AD3D1",
						label: "Green"
					},
					{
						value: 100,
						color: "#FDB45C",
						highlight: "#FFC870",
						label: "Yellow"
					},
					{
						value: 40,
						color: "#949FB1",
						highlight: "#A8B3C5",
						label: "Grey"
					},
					{
						value: 120,
						color: "#4D5360",
						highlight: "#616774",
						label: "Dark Grey"
					}

				];
	
	var ratio=[1,2,3,4];
	var m=4;
	
	
	$(document).ready(function(){
		
		
		var wrapper = document.getElementById("wrapper");
		
		var container = document.createElement("div");
		container.setAttribute("class","container-fluid");
		
		var row1 = document.createElement("div");
		row1.setAttribute("class","row-fluid");
		
		var span12_1 = document.createElement("div");
		span12_1.setAttribute("class","span12");
		
		var row2 = document.createElement("div");
		row2.setAttribute("class","row-fluid");
		
		var span12_2 = document.createElement("div");
		span12_2.setAttribute("class","span12");
		
		var badge = document.createElement("div");
		badge.setAttribute("class","badge");
		badge.setAttribute("id","qid");
		
		var row3 = document.createElement("div");
		row3.setAttribute("class","row-fluid");
		
		var span4_1 = document.createElement("div");
		span4_1.setAttribute("class","span4");
		span4_1.setAttribute("id","table");
		
		var span4_2 = document.createElement("div");
		span4_2.setAttribute("class","span4");
		span4_2.setAttribute("id","bar");
		
		var span4_3 = document.createElement("div");
		span4_2.setAttribute("class","span4");
		span4_2.setAttribute("id","pie");
		
		
		//
		var table= document.createElement("table");
		table.setAttribute("class","table table-bordered table-striped");
		var thead=document.createElement("thead");
		var tr1=document.createElement("tr");
		var th1=document.createElement("th");
		var th2=document.createElement("th");
		th1.innerText = "答案选项";
		th2.innerText = "比例";
		tr1.appendChild(th1);
		tr1.appendChild(th2);
		thead.appendChild(tr1);
		table.appendChild(thead);
		var tbody=document.createElement("tbody");
		for (var i=1;i<=ratio.length;i++){
			
			var tr=document.createElement("tr");
			var td1=document.createElement("td");
			var td2=document.createElement("td");
			td1.innerText = "选项"+i;
			td2.innerText =  ratio[i-1];
			tr.appendChild(td1);
			tr.appendChild(td2);
			tbody.appendChild(tr);
			
		}
		var tr2 =document.createElement("tr");
		var td = document.createElement("td");
		td.setAttribute("colspan","2");
		td.innerText ="受访人数："+ m;
		tr2.appendChild(td);
		tbody.appendChild(tr2);
		table.appendChild(tbody);

		
		
		
		//
		var canvas2= document.createElement("canvas");
		canvas2.setAttribute("id","canvas2");
		var canvas3= document.createElement("canvas");
		canvas3.setAttribute("id","canvas3");
		
		span4_1.appendChild(table);
		span4_2.appendChild(canvas2);
		span4_3.appendChild(canvas3);
		
		
		
		row3.appendChild(span4_1);
		row3.appendChild(span4_2);
		row3.appendChild(span4_3);
		
		span12_2.appendChild(badge);
		span12_2.appendChild(row3);
		
		row2.appendChild(span12_2);
		
		span12_1.appendChild(row2);
		
		row1.appendChild(span12_1);
		
		container.appendChild(row1);
		
		wrapper.appendChild(container);
		
		
		
		var canvas2 = document.getElementById("canvas2");
	    var ctx2 = canvas2.getContext("2d"); 

		window.myBar =new Chart(ctx2).Bar(barChartData, {
				responsive:true
			});
		
        var canvas3 = document.getElementById("canvas3");
        var ctx3 = canvas3.getContext("2d"); 
        window.myPie = new Chart(ctx3).Pie(pieData);
	});
	
	</script>



  </body>
</html>
