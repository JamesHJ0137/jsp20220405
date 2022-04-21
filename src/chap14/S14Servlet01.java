package chap14;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import javax.sql.*;

/**
 * Servlet implementation class S14Servlet01
 */
@WebServlet("/S14Servlet01")
public class S14Servlet01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public S14Servlet01() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ServletContext application = getServletContext();
		List<String> cities = new ArrayList<>();
		
		// database에서 records 가져오기
		// 1. 연결 설정
		DataSource ds = (DataSource) application.getAttribute("dbpool");

		String sql = "SELECT city FROM Customers";
		try (
				Connection con = ds.getConnection();
				// 2. statement 객체 생성
				Statement stmt = con.createStatement();
				// 3. 쿼리 생성
				ResultSet rs = stmt.executeQuery(sql);) {

			// 4. 실행결과 정제
			while (rs.next()) {
				String city = rs.getString(1);
				cities.add(city);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}


	// 5. 자원 닫기
//		rs.close();
//		stmt.close();
//		con.close();

//		List<String> cities = new ArrayList<>();
//		cities.add("Berlin");
//		cities.add("London");
//		cities.add("Madrid");

	// request에 records 넣기
		request.setAttribute("cities", cities);

	// jsp로 forward
	String location = "/WEB-INF/view/chap14/ex01.jsp";
	request.getRequestDispatcher(location).forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
