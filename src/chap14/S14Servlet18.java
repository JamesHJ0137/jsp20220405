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
 * Servlet implementation class S14Servlet18
 */
@WebServlet("/S14Servlet18")
public class S14Servlet18 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public S14Servlet18() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sql = "SELECT CustomerID, CustomerName, City, Country, PostalCode "
				+ "FROM Customers "
				+ "ORDER BY CustomerID";
		
		List<Customer> list = new ArrayList<>();
		
		ServletContext application = getServletContext();
		DataSource ds = (DataSource) application.getAttribute("dbpool");
		
		try (
				Connection con = ds.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql)
				) {
			
			while (rs.next()) {
				Customer cus = new Customer();
				cus.setId(rs.getInt(1));
				cus.setName(rs.getString(2));
				cus.setCity(rs.getString(3));
				cus.setCountry(rs.getString(4));
				cus.setPostCode(rs.getString(5));
				
				list.add(cus);
			}
			request.setAttribute("customerList", list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String path = "/WEB-INF/view/chap14/ex12.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		String sql = "DELETE FROM Customers "
				+ "WHERE CustomerID = ? ";
		
		ServletContext application = getServletContext();
		DataSource ds = (DataSource) application.getAttribute("dbpool"); // dbpool : JDBCListener?????? DB??? ????????? ????????? ????????? ??????
		
		int result = 0;
		try (
				Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql); // preparedStatement??? sql??? ???? ?????? ??? ??????
				) {
			
			pstmt.setInt(1, Integer.parseInt(id)); // ????????? ???????????? (pstmt.setInt(1, id);?????? ??????
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String location = "S14Servlet18";
		
		if(result == 1) {
			location += "?success=true";
		} else {
			location += "?success=false";
		}
		
		response.sendRedirect(location);
	}

}








