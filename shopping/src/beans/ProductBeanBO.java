package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;








import jdbc.ConnDB;
import beans.ProductBean;


public class ProductBeanBO {
	
	
	 private  Connection ct = null; 										//连接数据库对象
	 private  PreparedStatement ps = null; 
	 private  ResultSet rs=null;  
	
	 //得到订单
	 public  List<ProductBean> getlist(int userId , int state){
		                                           
		 List<ProductBean>list=new ArrayList<ProductBean>();
			
			try {
				ct = ConnDB.getConn(); 
				ps = ct.prepareStatement("SELECT * FROM dingdan WHERE userId="+userId+" and state="+state);						
				rs=ps.executeQuery();
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		     try {
				while(rs.next()){                                              //将数据表中的信息存入list中
					 ProductBean pb=new ProductBean();
					 pb.setIddingdan(rs.getInt(1));
					 pb.setPro_name(rs.getString(2));
					 pb.setPro_price(rs.getString(3));
					 pb.setPro_num(rs.getInt(4));
					 pb.setUserId(rs.getInt(5));
					 pb.setGoodsId(rs.getInt(6));
					 pb.setState(rs.getInt(7));
					 
					 list.add(pb); 
				 }
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}finally{
				this.close();
			}
		   //  System.out.println(""+list);
		     return list;
		     
	}
	//添加订单
	 public void add(ProductBean p){
		ProductBeanBO pbb = new ProductBeanBO();
		 try {
			
			 if(pbb.check(p)){
				 ct = ConnDB.getConn();
				 ps = ct.prepareStatement("insert into dingdan (pro_name,pro_price,pro_num,userId,goodsId,state) value(?,?,?,?,?,?)");
				 ps.setString(1, p.getPro_name());
				 ps.setString(2, p.getPro_price());
				 ps.setInt(3, 1);
				 ps.setInt(4, p.getUserId());
				 ps.setInt(5, p.getGoodsId());
				 ps.setInt(6, 0);
				 ps.executeUpdate();
			 }else{
				 ct = ConnDB.getConn();
				 ps = ct.prepareStatement("update dingdan set pro_num=pro_num+1 where goodsId="+p.getGoodsId()+" and userId="+p.getUserId());
				 ps.executeUpdate();
			 }
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		 
	 }
	 
	 
	 //检查该用户是否已添加过该商品
	 public  boolean check(ProductBean p){
		 boolean flag=true;
		 try {
			 ct = ConnDB.getConn();
			 ps = ct.prepareStatement("select * from dingdan where userId="+p.getUserId());
			 rs = ps.executeQuery();
			 while(rs.next()){
				 if(rs.getInt(6)==p.getGoodsId()&&rs.getInt(7)==0)
					 flag = false;
				 
			 }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		 return flag;
	 }
	
	 
	//删除订单内容
	public  int delete(int id) {
		 								
		int i = 0; 												//设置更新语句行数
		try {
			ct = ConnDB.getConn(); 						//获取数据库连接
			ps = ct.prepareStatement("DELETE FROM dingdan WHERE iddingdan="+id); //使用预编译语句进行删除操作									
			i = ps.executeUpdate();								//执行更新
		} catch (Exception e) {									
			//JOptionPane.showMessageDialog(null,"插入数据时发生异常","Message",JOptionPane.INFORMATION_MESSAGE);			
			e.printStackTrace();
		} finally {
			this.close(); 								//关闭连接数据库对象s
		}
		//System.out.println(i);
		return i;
	}
	
	
	//根据用户id更改订单状态
	public void changeState(int id){
		try {
			ct = ConnDB.getConn();
			ps = ct.prepareStatement("update dingdan set state=1 where userId="+id);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
	}
	
	
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
