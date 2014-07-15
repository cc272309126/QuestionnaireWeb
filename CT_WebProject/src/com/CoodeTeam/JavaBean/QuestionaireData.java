package com.CoodeTeam.JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import com.CoodeTeam.JavaBean.DBAccess;

public class QuestionaireData{
	
	private String title;
	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	private String time;
	private String state;
	
	
	public String showData(int userId,int option){
		String result = "<table class ='table table-bordered table-striped' id='tab' >"
			          + "<thead><tr><th>问卷标题</th><th>创建时间</th><th>状态</th><th>操作</th></tr></thead>"
			          + "<tbody>";
		DBAccess db = new DBAccess();
		if(db.createConn())
		{
			try {
				System.out.println(0);
				//userId = 1; 
				String sql ="";
				if(option == 1){
					System.out.println(1);
					sql="select * from questionaire where Users_idUsers= "+userId+" order by launchdate";
				}
				else if(option == 2){
					System.out.println(2);
					sql="select * from questionaire where state ='closed' and Users_idUsers= "+userId+" order by launchdate";
				}
				else{
					System.out.println(3);
					sql="select * from questionaire where state ='open' and Users_idUsers= "+userId+"order by launchdate";
				}
				db.query(sql);
				ResultSet rs = db.getRs();
				while(db.next())
				{
					//System.out.print(getTime("launchtime"));
					result = result + "<tr><td>" + rs.getString("title") 
					+ "</td><td>" + rs.getString("launchdate")
					+ "</td><td>" + rs.getString("state") + "</td></tr>";
				} 
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		result = result + "</tbody></table>";
		return result;
	}
	
	
}