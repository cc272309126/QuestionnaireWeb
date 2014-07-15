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
		String result = "<table style='margin-right:100px' class ='table table-condensed table-bordered table-striped' id='tab' >"
			+ "<thead><tr><th>问卷标题</th><th>创建时间</th><th>状态</th><th>操作</th></tr></thead>"
			+ "<tbody>";
		DBAccess db = new DBAccess();
		if(db.createConn())
		{
			try {
				String sql ="";
				if(option == 1){
					sql="select * from questionaire where state ='creating' and Users_idUsers= "+userId+" order by launchdate";
				}
				else if(option == 2){
					sql="select * from questionaire where state ='open' and Users_idUsers= "+userId+" order by launchdate";
				}
				else if(option == 3){
					sql="select * from questionaire where state ='closed' and Users_idUsers= "+userId+" order by launchdate";
				}
				else if(option == 4){
					sql="select * from questionaire inner join answers on questionaire.idQuestionare = answers.Questionare_idQuestionare";
				}
				db.query(sql);
				ResultSet rs = db.getRs();
				
				while(db.next())
				{
					String sta = rs.getString("state");
					System.out.println(sta);
					//if(sta== "open"){sta = sta+"    ";}
					//else if(sta=="closed"){sta =sta+"  ";}
					System.out.println(sta);
					result = result + "<tr><td width=180>" + rs.getString("title") 
					+ "</td><td width=80>" + rs.getString("launchdate")
					+ "</td><td width=10>" + sta;
					int qid = rs.getInt("idQuestionare");
					String qst = rs.getString("state");
					qst = '"'+qst+'"';
					result = result + "</td><td width=130><button class='btn btn-small btn-primary' onclick='ViewQ("+qid+","+qst+")'><i class='icon-search'></i></button>&nbsp&nbsp&nbsp";
					if(option == 1){ 
						result = result + "<button class='btn btn-small btn-primary' onclick='EditQ("+qid+","+qst+")'><i class='icon-edit'></i></button>&nbsp&nbsp&nbsp"
						+ "<button class='btn btn-small btn-primary' onclick='PublishQ("+qid+","+qst+")'><i class='icon-share-alt icon-white'></i></button>&nbsp&nbsp&nbsp" 
						+ "<button class='btn btn-small btn-primary' onclick='RemoveQ("+qid+","+qst+")'><i class='icon-trash icon-white'></i></button></td></tr>";
					}else if(option == 2){
						result = result + "<button class='btn btn-small btn-primary' onclick='ResultQ("+qid+","+qst+")'><i class='icon-bar-chart icon-white'></i></button>&nbsp&nbsp&nbsp" 
						+ "<button class='btn btn-small btn-primary' onclick='CloseQ("+qid+","+qst+")'><i class='icon-remove icon-white'></i></button>&nbsp&nbsp&nbsp"
						+ "<button class='btn btn-small btn-primary' onclick='RemoveQ("+qid+","+qst+")'><i class='icon-trash icon-white'></i></button></td></tr>";
					}else if(option == 3){
						result = result + "<button class='btn btn-small btn-primary' onclick='PublishQ("+qid+","+qst+")'><i class='icon-share-alt icon-white'></i></button>&nbsp&nbsp&nbsp" 
						+ "<button class='btn btn-small btn-primary' onclick='ResultQ("+qid+","+qst+")'><i class='icon-bar-chart icon-white'></i></button>&nbsp&nbsp&nbsp" 
						+ "<button class='btn btn-small btn-primary' onclick='RemoveQ("+qid+","+qst+")'><i class='icon-trash icon-white'></i></button></td></tr>";
					}else if(option == 4){
						result = result + "<button class='btn btn-small btn-primary' onclick='ResultQ("+qid+","+qst+")'><i class='icon-bar-chart icon-white'></i></button></td></tr>";
					}
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