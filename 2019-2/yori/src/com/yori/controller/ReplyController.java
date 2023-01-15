package com.yori.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yori.domain.RecipeDTO;
import com.yori.domain.ReplyDTO;
import com.yori.repository.RecipeDAO;
import com.yori.repository.ReplyDAO;

@WebServlet("/reply/*")
public class ReplyController extends HttpServlet {
	
	private static ReplyDAO replyDAO = new ReplyDAO();
	private static RecipeDAO recipeDao = new RecipeDAO();
	private String pathInfo = "";

    public ReplyController() {
        super();
    }
    
    protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		pathInfo = request.getPathInfo().split("/")[1];
		super.service(request, response);
	}
    		
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		switch (pathInfo) {
		case "list":
			ArrayList<ReplyDTO> replyList = replyDAO.list(Integer.parseInt(request.getParameter("num")));
			request.setAttribute("replyList", replyList);
			dispatch(request, response, "/recipedetail.jsp");
			break;
		case "sibal":
			ArrayList<RecipeDTO> populmenu = recipeDao.Populmenu();
			request.setAttribute("populmenu", populmenu);
			dispatch(request, response, "/sibal.jsp");
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		switch(pathInfo) {
		case "insert":
			ReplyDTO insertReplyDTO = new ReplyDTO();
			
			insertReplyDTO.setRpContent(request.getParameter("reply_content"));
			insertReplyDTO.setMemId(request.getParameter("memId"));
			insertReplyDTO.setRecNum(Integer.parseInt(request.getParameter("recNum")));
			insertReplyDTO.setRpStar(Integer.parseInt(request.getParameter("star")));	
			insertReplyDTO.setRpDate(request.getParameter("date"));
				
			int result = replyDAO.insert(insertReplyDTO);
	        if (result == 1) {
	           response.getWriter().print("SUCCESS");
	        } else {
	           response.getWriter().print("FAIL");
	        } 
			break;
		}
	}
	
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String uri)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(uri);
		dispatcher.forward(request, response);
	}

}
