package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.GoodsBean;
import beans.GoodsBeanBO;
import beans.ProductBean;
import beans.ProductBeanBO;
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProductServlet() {
		super();
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		//获取商品id
		int GoodsId = Integer.parseInt(request.getParameter("GoodsId"));
		String lei = request.getParameter("lei");
		String sousuo = request.getParameter("sousuo");
		
		GoodsBean gb = new GoodsBean();
		GoodsBeanBO gbb = new GoodsBeanBO();
		ProductBean pb = new ProductBean();
		ProductBeanBO pbb = new ProductBeanBO();
		gb = gbb.getGoodsBean(GoodsId);
		
		
		try {
			pb.setUserId((Integer) request.getSession().getAttribute("userId"));
			pb.setPro_name(gb.getName());
			pb.setPro_price(gb.getPrice());
			//pb.setPro_num(1);
			pb.setGoodsId(GoodsId);
			
			pbb.add(pb);
			gbb.reduce(GoodsId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		if(lei!=null){
			request.setAttribute("lei", lei);
			request.getRequestDispatcher("phone.jsp").forward(request, response);
		}
		
		if(sousuo!=null){
			request.setAttribute("sousuo", sousuo);
			request.getRequestDispatcher("sousuo.jsp").forward(request, response);
		}
		
		
		
	
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
