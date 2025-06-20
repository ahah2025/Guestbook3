package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestDAO;
import com.javaex.util.WebUtil;
import com.javaex.vo.GuestVO;

@WebServlet("/gbookc")
public class GuestbookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String regDate;
	private GuestVO guestVO1;

	public GuestbookController() {	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("GuestbookController");

		String action = request.getParameter("action");
		System.out.println(action); // 업무구분

		if ("list".equals(action)) { // 리스트업무
			System.out.println("리스트");

			// db데이터가져온다 --> list
			GuestDAO guestDAO = new GuestDAO();
			List<GuestVO> gList = guestDAO.guestSelect();
			
			request.setAttribute("gList", gList);

			// *포워드
			WebUtil.forward(request, response, "/WEB-INF/list.jsp");

		}else if("wform".equals(action)) { //등록폼업무  (등록업무랑 구별할것)
			System.out.println("등록폼");
	
			//등록폼을 응답해야한다
			//1)DB관련 할일이 없다 - 안하면된다
			
			//2)jsp에게 화면을 그리게 한다(포워드)
			//writeForm.jsp 포워드한다
			WebUtil.forward(request, response, "/deleteForm.jsp");
		
		}else if("add".equals(action) ) { //등록업무
			System.out.println("등록");
			
			//파라미터 꺼내기
			String name = request.getParameter("name");
			String password = request.getParameter("password") ;
			String content = request.getParameter("content") ;
			String regDate = request.getParameter("regDate") ;
			
			//데이터를 묶는다
			GuestVO guestDAO = new GuestVO(name, password, content,regDate);
			
			//DAO를 통해서 저장시키기
			GuestDAO guestDA1= new GuestDAO();
			guestDA1.guestInsert(guestVO1);
			
			//리다이렉트
			response.sendRedirect("http://localhost:8080/guestbook3/gbookc?action=list");
			
		}else if("delete".equals(action)) {
			System.out.println("삭제");
		
			//파라미터에서 no 꺼내온다
			int no = Integer.parseInt(request.getParameter("no"));
			
			//dao를 통해서 no를 주고 삭제
			GuestDAO guestDAO = new GuestDAO();
			guestDAO.guestDelete(no);
			
			
			//리다이렉트 action=list
			response.sendRedirect("http://localhost:8080/guestbook3/gbookc?action=list");
				
		}else if("modify".equals(action)) {
			System.out.println("수정폼");
			
			//파라미터에서  no 꺼내온다
			int no =  Integer.parseInt(request.getParameter("no"));
			String name = request.getParameter("name");
			String password =  request.getParameter("password");
			String content = request.getParameter("content");
			
			//데이터를 묶는다
			GuestVO guestVO = new GuestVO(no, name, password, content, regDate);
						
			//dao를 통해서 no를 주고 삭제
			GuestDAO guestDAO = new GuestDAO();
			GuestVO guestVO1 = guestDAO.guestSelectOne(no);
			
			response.sendRedirect("http://localhost:8080/guestbook3/gbookc?action=list");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
