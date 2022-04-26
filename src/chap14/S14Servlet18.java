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
		DataSource ds = (DataSource) application.getAttribute("dbpool"); // dbpool : JDBCListener에서 DB와 연결한 작업을 불러온 이름
		
		int result = 0;
		try (
				Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql); // preparedStatement는 sql에 ?가 붙을 때 사용
				) {
			
			pstmt.setInt(1, Integer.parseInt(id)); // 물음표 채우기용 (pstmt.setInt(1, id);로도 가능
			
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








