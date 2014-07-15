package com.CoodeTeam.JavaBean;
import  java.sql.Connection ;
import java.sql.DriverManager;
import  java.sql.ResultSet;
import java.sql.SQLException;
import com.CoodeTeam.JavaBean.questionnaireCreate;
import com.CoodeTeam.JavaBean.DBAccess;

import com.mysql.jdbc.Statement;
public class Users {
	public String password ="";
   public String idUser="0";
   public String usersname="";
   public String useruserAuthority;
   public String sex="";
   public String address="";
   public String isonline="";
   public int age=0;
   public boolean isOnline=false;
   public String  IsAlive="";
   public boolean Alive;
 public  String transfer(String a)
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
 public  String IsAlive(String a)
 {
	 
	//int k = a.
	 if (a.equals("1"))
	 {
		 return "正常";
		 }
	 else
	 {
		 return "禁用";
	 }
 }
  public  String IsOnline(String a)
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
  public void  deleteUsers()
  {
	  
	  deleteAnswers(this.idUser);
	  deleteQuestionnaire(this.idUser );
	  String userid =this.idUser;
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql = "DELETE FROM users WHERE users.idUsers='"+userid+"';";
			db.update(sql);
			db.closeStm();
			db.closeConn();
		}
  }
  public void deleteAnswers(String id)
  {
	 
			String userid =id;
			DBAccess db = new DBAccess();
			if(db.createConn()){
				String sql = "DELETE FROM answers WHERE answers.UserID='"+userid+"';";
				db.update(sql);
				db.closeStm();
				db.closeConn();
			}
		
  }
  public void deleteQuestionnaire(String id )
  {   String userID =id ;
  
	 Connection conn=null;
    try{
    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root",password);
    Statement stmt=(Statement) conn.createStatement();
    ResultSet ra=stmt.executeQuery("SELECT * FROM Questionaire where Questionaire.Users_idUsers = '" +userID+"';");
     while (ra.next())
     {
 	 questionnaireCreate temp =new questionnaireCreate(ra.getString("idQuestionare"));
	  temp.deleteQuestionnaire();
 
   }
    ra.close();
    conn.close();
    }catch(Exception e)
    {
	   //out.println(e.getMessage());
	  }
	 
  }
  public String getSex(String a)
  {
	  if (a.equals("1"))
	  {
		  return "男";
	  }
	  else
	  {
		  
		  return "女"; 
	  }
  }
public Users()
{ super();
	 usersname="a";
     useruserAuthority="用户";
     sex="男";
    address="234";
     isonline="在线";
     IsAlive="正常";
	
	}

public Users(String idUser)  {
	super();
	this.idUser = idUser;
    Connection conn=null;
       try{
      Class.forName("com.mysql.jdbc.Driver");
     conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root",password);
     Statement stmt=(Statement) conn.createStatement();
     ResultSet ra=stmt.executeQuery("select * from users WHERE users.idUsers='"+idUser+"';");
      if(ra.next())
      {
    	  usersname=ra.getString("usersname");
    	  useruserAuthority=transfer(ra.getString("userAuthority"));
    	  sex=getSex(ra.getString("sex"));
    	  address=ra.getString("address");
    	  isonline=IsOnline(ra.getString("isonline"));
    	  if(ra.getString("isonline").equals("1"))
    	  {
    		  isOnline=true;
    	  }
    	  age=ra.getInt("age");
    	  this.IsAlive=IsAlive(ra.getString("isalive"));
    	  if(ra.getString("isalive").equals("1"))
    	  {
    		  Alive=true;
    	  }
      }
       ra.close();
       conn.close();
       }catch(Exception e)
       {
  	   //out.println(e.getMessage());
  	  }
     
	}
/*@made by hhl  
 * 
 */
//禁用用户
public void disableUser()
{   String userid=this.idUser;
	DBAccess db = new DBAccess();
	if(db.createConn()){
		String sql = "UPDATE `webdb`.`users` SET `isalive`='0' WHERE `idUsers`='"+userid+"';";
		db.update(sql);
		db.closeStm();
		db.closeConn();
		
	}
}
//启用用户
public void enableUser()
{
	String userid =this.idUser;
	DBAccess db = new DBAccess();
	if(db.createConn()){
		String sql = "UPDATE `webdb`.`users` SET `isalive`='1' WHERE `idUsers`='"+userid+"';";
		db.update(sql);
		db.closeStm();
		db.closeConn();
}
}
boolean IsOnline()
{
	return this.isOnline;

	}

public String showUser()
{String aa="";
aa+="<table align ="+"center"+"><tr></tr><tr> <td>姓名：</td><td>"
  +this.usersname+"</td></tr><tr> <td>"+"用户组：</td><td> "
  +this.useruserAuthority+"</td></tr><tr> <td>性别：</td><td>"
  +this.sex+"</td></tr><tr> <td>年龄：</td><td>"
  +this.age+"岁</td></tr><tr> <td>地址：</td><td>"
  +this.address+"</td></tr><tr> <td>是否在线：</td><td>"
  +this.isonline+"</td></tr><tr> <td> 状态：</td><td>"
  +this.IsAlive+"</td></tr><tr><td> </td><td>";

return aa;
	
}


	
//////////////////
public String getIdUser() {
	return idUser;
}
public void setIdUser(String idUser) {
	this.idUser = idUser;
}
public String getUsersname() {
	return usersname;
}
public void setUsersname(String usersname) {
	this.usersname = usersname;
}
public String getUseruserAuthority() {
	return useruserAuthority;
}
public void setUseruserAuthority(String useruserAuthority) {
	this.useruserAuthority = useruserAuthority;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getIsonline() {
	return isonline;
}
public void setIsonline(String isonline) {
	this.isonline = isonline;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
   
   
}
