<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%!
String password="";
//获取当前在线用户人数
int getUserCount(){
	int  temp=0 ;
	Connection conn=null;
  //  List list=null;
	try{
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root",password);
	Statement stmt=conn.createStatement();
	ResultSet ra=stmt.executeQuery("SELECT count(*) as onlineCount FROM users where users.isonline=1");
	//System.out.print(ra);
	//System.out.println(count);
	//ra.getr
	
	if (ra.next())
	{
	
	temp=ra.getInt("onlineCount");

	}
	ra.close();
	conn.close();
 
	}catch(Exception e)
	{
	  //out.println(e.getMessage());
	 }
	finally{
		
	}
	return temp;
	}

//获取问卷数量
int getQuestionCount(){
	int  temp=0 ;
	Connection conn=null;
  //  List list=null;
	try{
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root",password);
	Statement stmt=conn.createStatement();
	ResultSet ra=stmt.executeQuery("SELECT count(*) as QuestionCount FROM questionaire;");
	//System.out.print(ra);
	//System.out.println(count);
	//ra.getr
	
	if (ra.next())
	{
	
	temp=ra.getInt("QuestionCount");

	}
	ra.close();
	conn.close();

	}catch(Exception e)
	{
	  //out.println(e.getMessage());
	 }
	finally{
		
	}
	return temp;
	}

//获取答卷的数量
int getAnswerCount(){
	int  temp=0 ;
	Connection conn=null;
  //  List list=null;
	try{
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root",password);
	Statement stmt=conn.createStatement();
	ResultSet ra=stmt.executeQuery("SELECT count(*) as AnswerCount FROM answers;;");
	//System.out.print(ra);
	//System.out.println(count);
	//ra.getr
	
	if (ra.next())
	{
	
	temp=ra.getInt("AnswerCount");

	}
	ra.close();
	conn.close();

	}catch(Exception e)
	{
	  //out.println(e.getMessage());
	 }
	finally{
		
	}
	return temp;
	}


int getQuestionItem(){
	int  temp=0 ;
	Connection conn=null;
  //  List list=null;
	try{
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","gf258426");
	Statement stmt=conn.createStatement();
	ResultSet ra=stmt.executeQuery("SELECT count(*) as QuestionItem FROM users where users.isonline=1");
	//System.out.print(ra);
	//System.out.println(count);
	//ra.getr
	
	if (ra.next())
	{
	
	temp=ra.getInt("QuestionItem");

	}
	ra.close();
	conn.close();

	}catch(Exception e)
	{
	  //out.println(e.getMessage());
	 }
	finally{
		
	}
	return temp;
	}

%>
<head> <jsp:include page="head.jsp"/><link rel="stylesheet" type="text/css" href="css/xtab.css"/>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>运行状况</title>
</head>

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
            <li ><a href="questionnaire.jsp">管理问卷</a></li>
            <li class="active"><a href="RunningState.jsp">运行状况</a></li>
            
          </ul>
         
           <ul class="nav navbar-nav navbar-right">
            <li></li>
            <li><a href="TobeDone.jsp"><em><%=username  %></em></a></li>
           
  
          </ul>
       
        </div><!--/.nav-collapse -->
      </div>
    </div>
 <br></br><br></br>
 
 <center><h2>运行状态</h2></center>
<h4 align="center"></h4>
<br>
<table align ="center" ><tr></tr>
<tr> 
<td>当前有</td><td><%=getUserCount() %>个用户在线&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
</tr>
<tr>
<td>当前有</td><td><%=getQuestionCount() %>份问卷</td>
</tr>
<tr><td>当前有</td><td><%=getAnswerCount() %>份答卷</td>
</tr>   
</table>



<jsp:include page="footer.jsp"/>
</body>
</html>