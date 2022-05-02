package app01;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import app01.dao.ReplyDao;
import app01.dto.ReplyDto;

/**
 * Servlet implementation class ReplyModifyServlet
 */
@WebServlet("/reply/modify")
public class ReplyModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReplyModifyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() throws ServletException {
		ServletContext application = getServletContext();
		this.ds = (DataSource) application.getAttribute("dbpool");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// request 파라미터 수집 가공
		String boardIdStr = request.getParameter("boardId"); //jsp에 추가 하세요.
		String replyIdStr = request.getParameter("replyId");
		String content = request.getParameter("replyContent");
		int replyId = Integer.parseInt(replyIdStr);
		
		ReplyDto dto = new ReplyDto();
		dto.setBoardId(Integer.parseInt(boardIdStr));
		dto.setId(Integer.parseInt(replyIdStr));
		dto.setContent(content);
		
		// business logic
		ReplyDao dao = new ReplyDao();
		
		try(Connection con = ds.getConnection()) {
			dao.update(con, dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/*
		 * 쿼리: 
		 * 
		 * UPDATE Reply
		 * SET content = ?
		 * WHERE id = ? 
		 * 
		 */
		
		// 결과 세팅
		// 안해도됨..
		
		
		// forward / redirect
		String location = request.getContextPath() + "/board/get" + "?" + "id=" + boardIdStr;
		response.sendRedirect(location);
		
		
	}

}







