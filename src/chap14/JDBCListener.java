package chap14;

import java.io.*;
import java.sql.*;
import java.sql.Connection;
import java.sql.Statement;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;

import org.mariadb.jdbc.*;

/**
 * Application Lifecycle Listener implementation class JDBCListener
 *
 */
@WebListener
public class JDBCListener implements ServletContextListener {

	private MariaDbPoolDataSource pool;
	
	/**
	 * Default constructor.
	 */
	public JDBCListener() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent sce) {
		pool.close();
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application = sce.getServletContext();
		String jdbcInfoFilePath = "/WEB-INF/props/jdbc.properties";
		InputStream propsFile = application.getResourceAsStream(jdbcInfoFilePath);

		Properties props = new Properties();
		try {
			props.load(propsFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		String url = props.getProperty("db.url");
		String schema = props.getProperty("db.schema");
		String id = props.getProperty("db.id");
		String pw = props.getProperty("db.password");

		String dburl = "jdbc:mariadb://" + url + "/" + schema + "?user=" + id + "&password=" + pw;

		try {
			this.pool = new MariaDbPoolDataSource(dburl);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try (Connection con = pool.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT 333");) {

			if (rs.next()) {
				if (rs.getInt(1) == 333) {
					System.out.println("데이터베이스 연결 성공!");
					application.setAttribute("dbpool", pool);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
