<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@page import ="com.CoodeTeam.JavaBean.questionnaireCreate"%>
      <%@page import ="com.CoodeTeam.JavaBean.DynamicShow"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<link rel="stylesheet" type="text/css" href="css/styles.css"/> 
<link href="css/blue.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">

<script src="js/jquery-1.11.1.min.js"></script>

  <script src="js/jquery.icheck.js"></script>
 <% request.setCharacterEncoding("utf-8");
 
String qid=request.getParameter("qid");
questionnaireCreate temp=new questionnaireCreate(qid);
DynamicShow a=new DynamicShow(temp);
String af="";
%>
<script type="text/javascript">
$(document).ready(function(){
	$(".pinned").pin({
	    containerSelector: ".container"
	});
	$('input').iCheck({
	    checkboxClass: 'icheckbox_square-blue',
	    radioClass: 'iradio_square-blue',
	    increaseArea: '20%' // optional
	  });
});

</script>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>回答问卷</title>
</head>
<body >

<div class="container clearfix">

    <div class="row">
        <div class="left-col">
              <h2></h2>
            <p class="lead"></p>
            <p id="link-one"></p>
            <p id="link-two"></p>
            <p id="link-three"></p>
            <p><%=a.showPage() %>
        
           </p>
            <p></p>
           
        </div>
        <div class="right-col">
           <div class="pin-wrapper" style="height: 122px;">
                <ul class="nav pinned" >
                    
                    <li>单选</li>
                    <li>多选</li>
                    <li>判断</li>
                    <li>填空</li>
                    
                </ul>
            </div>
        </div>
    </div>

</div>
  







<%@include file = "footer.jsp" %>
</body>
</html>

