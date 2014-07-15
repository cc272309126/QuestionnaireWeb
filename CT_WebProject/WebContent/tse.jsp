<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.ResultSet" %>
<jsp:directive.page import="java.sql.Date"/>
<jsp:directive.page import="java.sql.Timestamp"/>
<jsp:directive.page import="java.sql.SQLException"/>
<jsp:directive.page import="com.CoodeTeam.JavaBean.DbManager"/>
<jsp:directive.page import="java.sql.PreparedStatement"/>

<head>    <jsp:include page="head.jsp"/>
<link rel="stylesheet" type="text/css" href="css/xtab.css"/>  
<%!

public static String getPagination(int pageNum, int pageCount,
		int recordCount, String pageUrl) {
         String a="?";
         String url =""; //pageUrl.contains(a) ? pageUrl : pageUrl + "?";
         if (pageUrl.indexOf(a)>-1)
         {
        	 url=pageUrl;
         }
         else {
        	 url=pageUrl+"?";
         }
	//String url = pageUrl.contains(a) ? pageUrl : pageUrl + "?";
	if(!url.endsWith("?") && !url.endsWith("&")){
		url += "&";
	}

	//StringBuffer buffer = new StringBuffer();
	String buffer="";
	buffer=buffer+"第"+pageNum +"/"+ pageCount+"页   共 " + recordCount+"记录 ";
    if(pageNum == 1)
    {
    	buffer=buffer+" 第一页 ";
    }
    else {
    	buffer=" <a href='"+url+ "pageNum=1'>第一页</a> ";
    }
	//buffer.append(pageNum == 1 ?  : " <a href='" + url+ "pageNum=1'>第一页</a> ");
	 buffer+= (pageNum == 1) ? " 上一页 " : " <a href='" + url + "pageNum="
			+ (pageNum - 1) + "'>上一页</a> ";
	buffer+=(pageNum == pageCount )? " 下一页 " : " <a href='" + url
			+ "pageNum=" + (pageNum + 1) + "'>下一页</a> ";
	buffer+=(pageNum == pageCount )? " 最后一页 " : " <a href='" + url
			+ "pageNum=" + pageCount + "'>最后一页</a> ";

	buffer+=" 到 <input type='text' ";
	buffer+="  name='helloweenvsfei_goto_input' ";
	buffer+="  style='width:25px; text-align:center; '> 页 ";
	buffer+=" <input type='button'";
	buffer+="  name='helloweenvsfei_goto_button' value='Go'>";

	buffer+="<script language='javascript'>";
	buffer+="function helloweenvsfei_enter(){";
	buffer+="	if(event.keyCode == 13){";
	buffer+="		helloweenvsfei_goto();";
	buffer+=("		return false;");
	buffer+=("	}");
	buffer+=("	return true;");
	buffer+=("} ");
	buffer+="function helloweenvsfei_goto(){";
	buffer+="	var numText = document.getElementsByName('helloweenvsfei_goto_input')[0].value;";
	buffer+=("	var num = parseInt(numText, 10);");
	buffer+=("	if(!num){");
	buffer+=("		alert('页数必须为数字');	");
	buffer+=("		return;");
	buffer+=("	}");
	buffer+=("	if(num<1 || num>" + pageCount + "){");
	buffer+=("		alert('页数必须大于 1，且小于总页数 " + pageCount + " ');	");
	buffer+=("		return;");
	buffer+=("	}");
	buffer+=("	location='" + url + "pageNum=' + num;");
	buffer+=("}");
	buffer+=("document.getElementsByName('helloweenvsfei_goto_input')[0].onkeypress = helloweenvsfei_enter;");
	buffer+=("document.getElementsByName('helloweenvsfei_goto_button')[0].onclick = helloweenvsfei_goto;");
	buffer+=("</script>");

	return buffer;
}


int choose =0 ;  
 void test(){ choose=1;}
 void test2(){choose=2;}
 void test3(){choose=3;}
  void  DisableUser(String a)
 {
	   	   
	 
	       Connection conn=null;
	       try{
	      Class.forName("com.mysql.jdbc.Driver");
	      conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","");
	      Statement stmt=conn.createStatement();
	     ResultSet ra=stmt.executeQuery("UPDATE `webdb`.`users` SET `isalive`='0' WHERE `idUsers`='"+a+"';");
	       }catch(Exception e)
	       {
	  	   //out.println(e.getMessage());
	  	  }
 }
 String transfer(String a)
 {
	 
	//int k = a.
	 if (a.equals("2"))
	 {return "管理员";
		 }
	 else
	 {
		 return "用户";
	 }
 }
 String IsOnline(String a)
 {
	 
	//int k = a.
	 if (a.equals("1"))
	 {return "在线";
		 }
	 else
	 {
		 return "离线";
	 }
 }
 String Isalive(String a)
 {
	 
	//int k = a.
	 if (a.equals("1"))
	 {return "正常";
		 }
	 else
	 {
		 return "封禁";
	 }
 }
%> 

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理用户</title>

</head>


<body>  

<!-- 
<jsp:include page="header.jsp"/>
 -->
 
 <% 
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
<!--  
  <h3 align ="center">
 <a href='tse.jsp' >管理用户</a> &nbsp;&nbsp;
 <a href='questionnaire.jsp' >管理问卷</a> &nbsp;&nbsp;
 <a href='RunningState.jsp' >运行状况</a> 
 </h3>
 -->
 
  <% if (choose == 1) {     %>
      <p> Today is weekend</p>
  <% } else if (choose ==2){ %>
      <p> Today is not1 weekend</p>
  <% } else if (choose ==3){  %>
      <p>   Today is not2 weekend  </p> 
      <%} else  {%> <p> </p>  <%  }
%>  
 	<%
 	final int pageSize = 10;	// 一页显示 10 条记录

	int pageNum = 1; 			// 当前页数
	int pageCount = 1;			// 总页数

	int recordCount = 0;		// 总记录数
	
	try{
		// 从地址栏参数取当前页数
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}catch(Exception e){}
	
	String sql = null;
	
	Connection conn = null;
	PreparedStatement preStmt = null;
	ResultSet ra = null;
	
	try{
		sql = "SELECT count(*) FROM users ";
		
		recordCount = DbManager.getCount(sql);
		
		// 计算总页数
		pageCount = ( recordCount + pageSize - 1 ) / pageSize;
		// 本页从 startRecord 行开始
		int startRecord = ( pageNum - 1) * pageSize;
		
		// MySQL 使用limit实现分页
		sql = "SELECT * FROM users LIMIT ?, ? ";
		
		conn = DbManager.getConnection();
		preStmt = conn.prepareStatement(sql);
		DbManager.setParams(preStmt, startRecord, pageSize);
		ra = preStmt.executeQuery();
   
    
    
    %>
<center><h2>用户表</h2></center>
<table border="1" align="center" id=one>
   <tr>
      <th>用户号</th>
      <th>用户名</th>
      <th>用户组</th>
      <th>是否在线</th>
      <th>状态</th>
      <th>管理</th>
    
   </tr>
   <% while(ra.next()) { %>
      <tr bgcolor="lightblue">
     <td><%=ra.getString("idUsers") %></td>
     <td><%=ra.getString("usersname") %></td>
     <td><%=transfer(ra.getString("userAuthority"))%></td>
     <td><%=IsOnline(ra.getString("isonline"))%></td>
     <td><%=Isalive(ra.getString("isalive"))%></td>
     <td>  
           &nbsp;&nbsp;
           <%if(ra.getString("userAuthority").equals("1")) {%>
           
           <a href='UserInformation.jsp?action=show&id=<%=ra.getString("idUsers")%>' >用户详细信息</a>
            <% }%>
            
   </tr> 
   <%} %>
</table>
 <table align=center>
 <tr><td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= getPagination(pageNum, pageCount, recordCount, request.getRequestURI()) %> </td></tr></table>
  <br/><br/><br/>
 
  <%
  
  
  
    
   } catch(Exception e)
  {
	     out.println(e.getMessage());
	  }
   finally
   {
	   ra.close();
	   conn.close(); 
   }%>
  <jsp:include page="footer.jsp"/>
</body>
</html>