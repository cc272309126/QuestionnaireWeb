<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
      <%@page import ="com.CoodeTeam.JavaBean.questionnaireCreate"%>
      <%@page import ="com.CoodeTeam.JavaBean.DynamicShow"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/styles.css"/> 
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
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
</head>
<body>
<%@include file= "header2.jsp" %>
<% 
String qid=request.getParameter("qid")+"";

if (username==null)
{
	response.sendRedirect("login.jsp");
}
int userid=(Integer)session.getAttribute("UserID");
String Uid =userid+"";

questionnaireCreate temp=new questionnaireCreate(qid);
DynamicShow a=new DynamicShow(temp);
String af="";
%>

<div class="container clearfix">

    <div class="row">
        <div class="left-col">
              <h2> 我的答卷</h2>
            <p class="lead"></p>
            <p id="link-one"></p>
            <p id="link-two"></p>
            <p id="link-three"></p>
            <p>
             <%=a.showMyAnswerPage(Uid) %>
           </p>
            <p></p>
        </div>
        <div class="right-col">
           <div class="pin-wrapper" style="height: 122px;">
                <ul class="nav pinned" style="width: 48px; right: 74.5px; top: 120px; position: fixed;">
                    
                    <li>单选</li>
                    <li>多选</li>
                    <li>判断</li>
                    <li>填空</li>
                    
                </ul>
            </div>
        </div>
    </div>

</div>
</body>
</html>