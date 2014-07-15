<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@page import ="com.CoodeTeam.JavaBean.questionnaireCreate"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
request.setCharacterEncoding("UTF-8");


String id = request.getParameter("id");
String action = request.getParameter("action");
questionnaireCreate temp=new questionnaireCreate(id);
if("del".equals(action)){
	
	temp.disablequestionnaire();
	response.sendRedirect("QuestionaireInformation.jsp?action=show&id="+id); 
}
else if(action.equals("add"))
{
	temp.enablequestionnaire();
	response.sendRedirect("QuestionaireInformation.jsp?action=show&id="+id);
	}
if (action.equals("delete"))
{
	temp.deleteQuestionnaire();
	response.sendRedirect("questionnaire.jsp");
	}
%>
<head><jsp:include page="head.jsp"/><link rel="stylesheet" type="text/css" href="css/xtab.css"/>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>问卷详细信息</title>
<style type="text/css">
	table{
		align:center;
	}
</style>

</head>
<body> <% 
    	String username =(String) session.getAttribute("username");
 		if (username==null)
 		{
 			response.sendRedirect("admin.jsp");
 		}
%>
   <!-- Fixed navbar --> 
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">CT问卷网</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="tse.jsp">管理用户</a></li>
            <li><a href="questionnaire.jsp">管理问卷</a></li>
            <li><a href="RunningState.jsp">运行状况</a></li>
            
          </ul>
         
           <ul class="nav navbar-nav navbar-right">
            <li></li>
            <li><a href="TobeDone.jsp"><em><%=username  %></em></a></li>
           
  
          </ul>
       
        </div><!--/.nav-collapse -->
      </div>
    </div>
 





<br></br><br></br>
<h1 align="center"> 问卷信息  </h1>
<h3 align ="center"> 
<%if(temp.alive)
{
	%>
	<a href='QuestionaireInformation.jsp?action=del&id=<%=id %>' onclick='alert("禁用该表单？");'>封禁</a>

<%}
 else
{ %>	
<a  href='QuestionaireInformation.jsp?action=add&id=<%=id %>' onclick='alert("解禁该表单？");'>解禁</a>	
<%} %>	
<a href ='QuestionaireInformation.jsp?action=delete&id=<%=id %>' onclick='alert("确定删除该表单？");'>删除</a>
<a href ='javascript:history.back(-1)' onclick="javascript :history.back(-1);">返回</a>
</h3>	

<h3 align="center"><%out.println(temp.show()); %>  </h3>
 
 <td><% out.println(temp.title);%></td>
 </tr>
<h4 align="center"><%out.println(temp.Select(id)); %></h4>
</table>
</h3>

 <jsp:include page="footer.jsp"/>
</body>
</html>