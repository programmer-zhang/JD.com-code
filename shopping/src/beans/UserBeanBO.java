package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jdbc.ConnDB;





public class UserBeanBO {
	
	private Connection ct=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	
	//添加用户
	public boolean add(UserBean u){
		boolean flag=false;
		
		try {
			
			
			if(addm(u.getUsername(),u.getPassword())==false){
				ct = ConnDB.getConn();
				ps = ct.prepareStatement("insert into users (username,password) value(?,?)");
				
				//添加用户名和密码
				ps.setString(1, u.getUsername());
				ps.setString(2, u.getPassword());
				
				int rows = ps.executeUpdate();
				if(rows>0){
					flag = true;
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return flag;
	}
	
	
	//根据用户名和密码，获得用户id
	public int getID(UserBean u){
		int id = 0;
		try {
			ct = ConnDB.getConn();
			ps = ct.prepareStatement("select id from users where username="+u.getUsername()+" and password="+u.getPassword());
			rs = ps.executeQuery();
			if(rs.next()){
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return id;
	}
	
	//检测用户登录
	public boolean addm(String username , String password){
		
		boolean flag = false;
		
		try {
			ct = ConnDB.getConn();
			ps=ct.prepareStatement("select password from users where username=?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()){
				if(rs.getString(1).equals(password)){
					flag = true;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		
		
		return flag;
	}
	
	
	//关闭函数
	public void close(){
		
		try {
			
			if(rs!=null){
				
				rs.close();
				rs=null;//
			}
			if(ps!=null){
				
				ps.close();
				ps=null;
			}
			
			if(!ct.isClosed()){
				
				ct.close();
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
