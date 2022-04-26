package chap14;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import javax.sql.*;

import chap14.javaBeans.*;

/**
 * Servlet implementation class S14Servlet19
 */
@WebServlet("/S14Servlet19")
public class S14Servlet19 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public S14Servlet19() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String sql = "SELECT CustomerID, CustomerName, City, Country, PostalCode " + "FROM Customers "
				+ "ORDER BY CustomerID " + "LIMIT ?, 10 ";

		
		
		int total = getTotal();
		
		String pageNumStr = request.getParameter("page");

		if (pageNumStr == null || pageNumStr.trim().equals("")) {
			pageNumStr = "1";
		}
		
		int pageNum = Integer.parseInt(pageNumStr);
		int startPage = (pageNum-1) / 10 * 10 + 1;
		int endPage = startPage + 9;

		int startRowNum = (pageNum - 1) * 10;
		
		int lastPage = (total - 1) / 10 + 1;
		
		endPage = Math.min(lastPage, endPage);

		ServletContext application = getServletContext();
		DataSource ds = (DataSource) application.getAttribute("dbpool");
		List<Customer> list = new ArrayList<>();

		try (
				Connection con = ds.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql);) {
			
			pstmt.setInt(1, startRowNum); // ?채우기
			try (ResultSet rs = pstmt.executeQuery();) { // 이후 원래 하던거에 담아서 쓰면 됌
				
				while (rs.next()) {
					Customer cus = new Customer();
					cus.setId(rs.getInt(1));
					cus.setName(rs.getString(2));
					cus.setCity(rs.getString(3));
					cus.setCountry(rs.getString(4));
					cus.setPostCode(rs.getString(5));

					list.add(cus);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("customerList", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("prevPage", startPage - 10);
		request.setAttribute("nextPage", startPage + 10);
		request.setAttribute("currentPage", pageNum);
		request.setAttribute("lastPage", lastPage);
		
		String path = "/WEB-INF/view/chap14/ex13.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	private int getTotal() {
		String sql = "SELECT COUNT(*) FROM Customers";
		
		ServletContext application = getServletContext();
		DataSource ds = (DataSource) application.getAttribute("dbpool");
		
		try(
				Connection con = ds.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				) {
			
			if (rs.next()) {
				return rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
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
