package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ProductBeanBO;
@WebServlet("/CartServlet")
public class CartSerlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CartSerlet() {
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
		
		String type=request.getParameter("type");
		String iddingdan = request.getParameter("iddingdan");
		ProductBeanBO pbb = new ProductBeanBO();
		if(type.equals("shanchu")){
			
			pbb.delete(Integer.parseInt(iddingdan));
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}else if(type.equals("xiadan")){
			 int urn = (Integer)request.getSession().getAttribute("userId");
			 pbb.changeState(urn);
			 request.getRequestDispatcher("cart.jsp").forward(request, response);
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

		doPost(request, response);
	}

}
