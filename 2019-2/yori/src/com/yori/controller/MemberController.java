package com.yori.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yori.domain.MemberDTO;
import com.yori.domain.RecipeDTO;
import com.yori.repository.MemberDAO;
import com.yori.repository.RecipeDAO;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	
	private static MemberDAO memberDAO = new MemberDAO();
	private String pathInfo = "";
	
    public MemberController() {
        super();
    }
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		pathInfo = request.getPathInfo().split("/")[1];
		super.service(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		switch (pathInfo) {
			case "login":
				dispatch(request, response, "/login.jsp");
				break;
			case "signup":
				dispatch(request, response, "/signup.jsp");
				break;
			case "mypage":
				dispatch(request, response, "/mypage.jsp");
			case "update":
				dispatch(request, response, "/Fixmypage.jsp");
				break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		switch (pathInfo) {
			case "login":
				MemberDTO loginMemberDTO = memberDAO.login(request.getParameter("memId"), request.getParameter("memPwd"));
				if (loginMemberDTO != null) {
					request.getSession().setAttribute("loginMember", loginMemberDTO);
					response.getWriter().print("SUCCESS");
				} else {
					response.getWriter().print("FAIL");
				}
				break;
			case "logout":
				request.getSession().removeAttribute("loginMember");
				break;
			case "signup":
	            MemberDTO signupMemberDTO = new MemberDTO();
	            signupMemberDTO.setMemId(request.getParameter("memId"));
	            signupMemberDTO.setMemPwd(request.getParameter("memPwd"));
	            signupMemberDTO.setMemName(request.getParameter("memName"));
	            signupMemberDTO.setMemNum(request.getParameter("memNum"));
	            signupMemberDTO.setMemGen(request.getParameter("memGen"));
	            
	            System.out.println(signupMemberDTO.getMemGen());
	            
	            int result = memberDAO.signup(signupMemberDTO);
	            if (result == 1) {
	               response.getWriter().print("SUCCESS");
	            } else {
	               response.getWriter().print("FAIL");
	            }
	            break;
			case "update":
				MemberDTO updateMemberDTO = new MemberDTO();
				updateMemberDTO.setMemId(request.getParameter("memId"));
				updateMemberDTO.setMemPwd(request.getParameter("memPwd"));
				updateMemberDTO.setMemName(request.getParameter("memName"));
				updateMemberDTO.setMemNum(request.getParameter("memNum"));
				updateMemberDTO.setMemGen(request.getParameter("memGen"));
				
				int result1 = memberDAO.updateMember(updateMemberDTO);
	            if (result1 == 1) {
	               response.getWriter().print("SUCCESS");
	            } else {
	               response.getWriter().print("FAIL");
	            }
				break;
		}
	}
	
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String uri) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(uri);
		dispatcher.forward(request, response);
	}
	
	
}
