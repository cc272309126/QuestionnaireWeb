<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%@ page import="java.sql.*" %> 
<head> <jsp:include page="head.jsp"/>
<link rel="stylesheet" type="text/css" href="css/xtab.css"/>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理问卷表</title>
</head>
<%! 
String password="";


String getusername(String a){
	String temp="" ;
Connection conn=null;

try{
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root",password);
Statement stmt=conn.createStatement();
ResultSet ra=stmt.executeQuery("select users.usersname from users where users.idUsers ='"+a+"'");
if (ra.next())
{
temp = ra.getString("usersname");
}
}catch(Exception e)
{
  //out.println(e.getMessage());
 } 
return  temp;
 }%>
<body><% 
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
            <li><a href="tse.jsp">管理用户</a></li>
            <li class="active"><a href="questionnaire.jsp">管理问卷</a></li>
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

<%
//out.println("gghaiu"+aaa()); 
  Connection conn=null;
  try
  {
     Class.forName("com.mysql.jdbc.Driver");
     conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root",password);
     Statement stmt=conn.createStatement();
     ResultSet ra=stmt.executeQuery("select * from questionaire");
   
    
    
    %>
<center><h2>问卷表</h2></center>
<table border="1" align="center" id=one>
   <tr>
      <th>问卷号</th>
      <th>问卷名</th>
      <th>问卷状态</th>
     
      <th>问卷发起人</th>
      <th>管理</th>
    
   </tr>
   <% while(ra.next()) { %>
      <tr bgcolor="lightgrey">
     <td><%=ra.getString("idQuestionare") %></td>
     <td><%=ra.getString("title") %></td>
     <td><%=ra.getString("State")%></td>
     <td><%=getusername(ra.getString("Users_idUsers"))%></td>
     <td>   
           &nbsp;&nbsp;
           <a href='QuestionaireInformation.jsp?action=show&id=<%=ra.getString("idQuestionare")%>' >问卷详细信息</a>
            
   </tr> 
  <%
  
   }
   ra.close();
   stmt.close();
    
   } catch(Exception e)
  {
	     out.println(e.getMessage());
	  } %>
</table>
 <jsp:include page="footer.jsp"/>
</body>
</html>