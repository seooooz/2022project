package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.RecHateCount;
import board.service.RecLikeCount;
import board.service.RecUpdate;
import member.service.Action;
import member.service.ActionForward;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println("requestURI : " + requestURI);
		//System.out.println("contextPath : " + contextPath);
		System.out.println("command : " + command);
		
		Action action = null;
		ActionForward forward = null;
		
		//추천수 업데이트
		if(command.equals("/Project/RecUpdate.do")) {
			try {
				action = new RecUpdate();
				action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		//좋아요 검색
		else if(command.equals("/Project/RecLikeCount.do")) {
			try {
				action = new RecLikeCount();
				action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		//싫어요 검색
		else if(command.equals("/Project/RecHateCount.do")) {
			try {
				action = new RecHateCount();
				action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("get");
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("post");
		doProcess(request, response);
	}

}