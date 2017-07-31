package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import beans.UserBean;
import beans.UserBeanBO;
@WebServlet("/ZhuceServlet")
public class ZhuceServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ZhuceServlet() {
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

		doPost(request, response);
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

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//获取用户注册的用户名和密码
		String urn = request.getParameter("username");
		String psw = request.getParameter("password");
		
		UserBeanBO um = new UserBeanBO();
		//创建用户对象
		UserBean u = new UserBean();
		
		//给用户对象添加名字和密码
		u.setUsername(urn);
		u.setPassword(psw);
		
		boolean flag = false;
		//判断是否注册成功
		try {
			flag = um.add(u);
			if(flag == true){
				HttpSession ht = request.getSession(true);
				ht.setAttribute("name", urn);
				ht.setAttribute("userId", um.getID(u));
		//成功注册后跳转
				
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	

}
