<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "com.CoodeTeam.JavaBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file= "head.jsp"%>
<title>我的问卷</title>
<script src="/js/jquery-1.11.1.min.js"></script>
<link href = "css/bootstrap-responsive.min.css" rel ="stylesheet">
<script type="text/javascript" language="javascript">

</script>
</head>
<body>

<%@include file= "header2.jsp" %>
<% 
	
if (username==null)
	{
		response.sendRedirect("login.jsp");
	}
int userid=(Integer)session.getAttribute("UserID");
%>
<br><br><br>
<div class="container" id="content">
<br><br>
<div class ="controls-row">
<div class="span2" ><button class="btn btn-primary" onclick="location.href='CreatQuestionaire.jsp'" >创建问卷</button></div>
<div class="span2" ><button class="btn btn-primary" onclick="location.href='MyQA.jsp'" >全部问卷</button></div>
<div class="span2" ><button class="btn btn-success" disabled onclick="location.href='MyQC.jsp'" >未发布问卷</button></div>
<div class="span2" ><button class="btn btn-primary" onclick="location.href='MyQO.jsp'" >已发布问卷</button></div>
</div>
</div><br><br>
 <div id = "con" class = "container">
 <%	QuestionaireData d = new QuestionaireData();
	out.print(d.showData(userid,2));%>
 </div>
 <%@include file = "footer.jsp" %>
</body>
</html>