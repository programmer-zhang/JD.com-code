package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import beans.GoodsBean;
import jdbc.ConnDB;

public class GoodsBeanBO {
	
	private ResultSet rs=null;
	private Connection ct=null;
	private PreparedStatement ps=null;
	
	//返回共有多少页
	
	public int getPageCount(int pageSize , String lei){
		int pageCount=0;
		int rowCount=0;
		try {
			ct=ConnDB.getConn();
			ps=ct.prepareStatement("select count(*) from goods where lei='"+lei+"'");
			rs=ps.executeQuery();
			
			
			if(rs.next()){
				rowCount=rs.getInt(1);
			}
			
			if(rowCount%pageSize==0){
				pageCount = rowCount/pageSize;
			}else{
				pageCount = rowCount/pageSize+1;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		
		return pageCount;
	}
	
	
	public int getPageCountmo(int pageSize , String name){
		int pageCount=0;
		int rowCount=0;
		try {
			ct=ConnDB.getConn();
			ps=ct.prepareStatement("select count(*) from goods where lei='"+name+"'");
			rs=ps.executeQuery();
			
			
			if(rs.next()){
				rowCount=rs.getInt(1);
			}
			
			if(rowCount%pageSize==0){
				pageCount = rowCount/pageSize;
			}else{
				pageCount = rowCount/pageSize+1;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		
		return pageCount;
	}
	
	//分页显示模糊查询内容
	public ArrayList getGoods(int pageSize,int pageNow,String name){
		
		ArrayList al=new ArrayList();
		
		try {
			
			ct=ConnDB.getConn();
			
			
			ps=ct.prepareStatement("select * from goods where name like '%"+name+"%' limit "+(pageNow-1)*pageSize+","+pageSize);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				GoodsBean gb=new GoodsBean();
				
				gb.setGoodsId(rs.getInt(1));
				gb.setName(rs.getString(2));
				gb.setLei(rs.getString(3));
				gb.setPrice(rs.getString(4));
				gb.setNumber(rs.getInt(5));
				gb.setPhoto(rs.getString(6));
				
				
				al.add(gb);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			this.close();
		}
		
		return al;
	}
	
	//分页显示货物的信息
	public ArrayList getGoodsByPage(int pageSize,int pageNow,String lei){
		
		ArrayList al=new ArrayList();
		
		try {
			
			ct=ConnDB.getConn();
			
			
			ps=ct.prepareStatement("select * from goods where lei='"+lei+"' limit "+(pageNow-1)*pageSize+","+pageSize);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				GoodsBean gb=new GoodsBean();
				
				gb.setGoodsId(rs.getInt(1));
				gb.setName(rs.getString(2));
				gb.setLei(rs.getString(3));
				gb.setPrice(rs.getString(4));
				gb.setNumber(rs.getInt(5));
				gb.setPhoto(rs.getString(6));
				
				
				al.add(gb);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			this.close();
		}
		
		return al;
	}
	

	//根据货物id，显示货物信息
	public GoodsBean getGoodsBean(int id){
		GoodsBean gb = new GoodsBean();
		
		try {
			ct = ConnDB.getConn();
			ps = ct.prepareStatement("select * from goods where goodsId=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				gb.setGoodsId(rs.getInt(1));
				gb.setName(rs.getString(2));
				gb.setLei(rs.getString(3));
				gb.setPrice(rs.getString(4));
				gb.setNumber(rs.getInt(5));
				gb.setPhoto(rs.getString(6));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return gb;
	}
	
	//根据id减少商品数量
	public  void reduce(int goodsId) {
		//GoodsBean gb = new GoodsBean();
		//GoodsBeanBO gbb = new GoodsBeanBO();	
		//gb=gbb.getGoodsBean(goodsId);											//设置更新语句行数
		try {
			ct = ConnDB.getConn(); 						//获取数据库连接
			ps = ct.prepareStatement("update goods set number=number-1 where goodsId="+goodsId); 		//使用预编译语句进行修改操作
			ps.executeUpdate();
		} catch (Exception e) {									
					
			e.printStackTrace();
		} finally {
			this.close(); 								//关闭连接数据库对象s
		}
		
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
