package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ActionForward;
import service.FreeAddService;
import service.FreeDetailService;
import service.FreeListService;
import service.FreeRemoveService;
import service.FreeService;



@WebServlet("*.do")
public class FreeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String urlMapping = requestURI.substring(contextPath.length());
		
		FreeService  service = null;
		
		
		ActionForward af = null;
	
				switch(urlMapping) {
				case "/list.do":
					System.out.println("list로 이동");
					service = new FreeListService();
					break;	
				case "/add.do":
					service = new FreeAddService();
					System.out.println("입력성공 add로 이동");
					break;
				case "/remove.do":
					service = new FreeRemoveService();
					System.out.println("리무브로 정보넘김");
					break;
				case "/detail.do":
					service = new FreeDetailService();
					break;	
					
				case "/insert.do":
					af = new ActionForward("/free/insert.jsp", false);
					break;
					
					
				default: System.out.println("실패함");
				
				}
				
				// 선택된 Service 실행
				try {
					if(service != null) {
						af = service.execute(request, response);
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
				
				// 어디로 어떻게 이동하는가?
				if(af != null) {
					if(af.isRedirect()) {
						response.sendRedirect(af.getView());
					} else {
						request.getRequestDispatcher(af.getView()).forward(request, response);
					}
				}
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
