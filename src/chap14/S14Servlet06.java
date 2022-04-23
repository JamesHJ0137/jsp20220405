package chap14;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import chap14.javaBeans.Employee;

/**
 * Servlet implementation class S14Servlet06
 */
@WebServlet("/S14Servlet06")
public class S14Servlet06 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public S14Servlet06() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String sql = "SELECT LastName, FirstName, BirthDate FROM Employees WHERE EmployeeID = 1";
		
		ServletContext application =  getServletContext();
		DataSource ds = (DataSource) application.getAttribute("dbpool");
		
		try(
				Connection con = ds.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				
				) {
			if(rs.next()) {
				Employee employee = new Employee();
				
				String ln  = rs.getString("LastName");
				String fn = rs.getString("FirstName");
				String bd = rs.getString("BirthDate");
				
				employee.setLastName(ln);
				employee.setFirstName(fn);
				employee.setBirthDate(bd);
				
				
				request.setAttribute("employee", employee);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String path = "WEB-INF/view/chap14/ex04.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
