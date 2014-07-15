<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.io.*,java.util.*" %>
    <%@page import ="com.CoodeTeam.JavaBean.questionnaireCreate"%>
    <%@page import ="com.CoodeTeam.JavaBean.Answers"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%request.setCharacterEncoding("UTF-8");
Enumeration paramNames = request.getParameterNames();
ArrayList<String > AnswersItems=new ArrayList<String >();
String QuestionnaireID="";
String qid=request.getParameter("qid")+"";

int userid=(Integer)session.getAttribute("UserID");
String Uid =userid+"";
while(paramNames.hasMoreElements()) {
   String paramName = (String)paramNames.nextElement();
   if(paramName.equals("qid"))
   {
	   QuestionnaireID=request.getParameter(paramName);
   }
   else if (paramName.indexOf("s")!=-1){
	   
	   String temp=request.getParameter(paramName);
	   
	   AnswersItems.add(temp);
	  // Collections.sort(AnswersItems);
   }
   else if(paramName.indexOf("m")!=-1)
   {
	   AnswersItems.add(paramName);
   }
   else if(paramName.indexOf("b")!=-1)
   {     String temp=request.getParameter(paramName);
	   AnswersItems.add(paramName+"Zf"+temp);
   }
   else if(paramName.indexOf("j")!=-1)
   {     String temp=request.getParameter(paramName);
	   AnswersItems.add(temp);
   }
   
}
 Answers temp=new Answers(AnswersItems,QuestionnaireID, Uid);
 temp.SaveAnswer();

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>回答完成</title>
</head>
<body>
<h2>谢谢您真心的参与！</h2>

</body>
</html>