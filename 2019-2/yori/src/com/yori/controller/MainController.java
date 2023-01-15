package com.yori.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yori.domain.RecipeDTO;
import com.yori.domain.ReplyDTO;
import com.yori.repository.RecipeDAO;
import com.yori.repository.ReplyDAO;

@WebServlet("/index")
public class MainController extends HttpServlet {
	
	private static RecipeDAO recipeDao = new RecipeDAO();
       
    public MainController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ArrayList<RecipeDTO> populmenu = recipeDao.Populmenu();
		request.setAttribute("populmenu", populmenu);
		dispatch(request, response, "/index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		}
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String uri)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(uri);
		dispatcher.forward(request, response);
		}
	}

