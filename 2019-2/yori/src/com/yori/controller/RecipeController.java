package com.yori.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.mysql.cj.Session;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yori.domain.CategoryhDTO;
import com.yori.domain.CategorykDTO;
import com.yori.domain.RecipeDTO;
import com.yori.repository.CategoryDAO;
import com.yori.repository.RecipeDAO;

@WebServlet("/recipe/*")
public class RecipeController extends HttpServlet {

	private static RecipeDAO recipeDAO = new RecipeDAO();
	private static CategoryDAO categoryDAO = new CategoryDAO();
	private String pathInfo = "";

	public RecipeController() {
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
			ArrayList<RecipeDTO> recipeList = recipeDAO.list();
			request.setAttribute("recipeList", recipeList);
			dispatch(request, response, "/recipeList.jsp");
			break;
		case "register":
			ArrayList<CategorykDTO> kindList = categoryDAO.kindlist();
			ArrayList<CategoryhDTO> howList = categoryDAO.howlist();
			request.setAttribute("kindList", kindList);
			request.setAttribute("howList", howList);
			dispatch(request, response, "/register.jsp");
			break;
		case "detail":
			RecipeDTO recipedetail = recipeDAO.detail(Integer.parseInt(request.getParameter("num")));
			request.setAttribute("recipedetail", recipedetail);

			ArrayList<CategorykDTO> kindListDetail = categoryDAO.kindlist();
			ArrayList<CategoryhDTO> howListDetail = categoryDAO.howlist();
			request.setAttribute("kindListDetail", kindListDetail);
			request.setAttribute("howListDetail", howListDetail);
			
			dispatch(request, response, "/reply/list");
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		switch (pathInfo) {
		case "register":     
            RecipeDTO insertRecipeDTO = new RecipeDTO();
            // ���몴�씠誘몄� �뾽濡쒕뱶
            /*String recImage = request.getParameter("recImage");
            String imageName = recImage.substring(12);
            */
            String path = request.getRealPath("/upload");
            PrintWriter out = response.getWriter();
            out.println("path :"+ path);
            MultipartRequest multi = new MultipartRequest(request, path);
            
            String imagePath = "/yori/upload/";
            String recImage0 = multi.getFilesystemName("recImage0");
            String recImage1 = multi.getFilesystemName("recImage1");
            String recImage2 = multi.getFilesystemName("recImage2");
            String recImage3 = multi.getFilesystemName("recImage3");
            String recImage4 = multi.getFilesystemName("recImage4");
            String recImage5 = multi.getFilesystemName("recImage5");
            
            String recPath = imagePath + recImage0 +"@"+ imagePath + recImage1 +"@"+ imagePath + recImage2 +"@"+ imagePath + recImage3 
                       +"@"+imagePath + recImage4 +"@"+ imagePath + recImage5;        
            
            /*String imagePath = "/yori/upload/" + imageName;*/
           
           insertRecipeDTO.setRecName(multi.getParameter("recName"));
           insertRecipeDTO.setRecText(multi.getParameter("recText"));
           insertRecipeDTO.setRecImage(recPath);
           insertRecipeDTO.setCateKind(multi.getParameter("cateKind"));
           insertRecipeDTO.setCateHow(multi.getParameter("cateHow"));
           
           
           insertRecipeDTO.setRecOrder(multi.getParameter("recOrder0")+"@"+multi.getParameter("recOrder1")+"@"
                 +multi.getParameter("recOrder2")+"@"+multi.getParameter("recOrder3")+"@"
                 +multi.getParameter("recOrder4"));
          
           insertRecipeDTO.setMemId(multi.getParameter("memId"));
           
           int result = recipeDAO.insert(insertRecipeDTO);
           if (result == 1) {
              response.sendRedirect("/yori/recipe/list");
           /* dispatch(request, response, "/recipe/list"); */
           } else {
              response.sendRedirect("/yori/recipe/list");
           } 
           break;
			
		case "recipeupdate":
			RecipeDTO changeRecipeDTO = new RecipeDTO();
			
			
			/*
			 * String recImage2 = request.getParameter("recImage"); String imageName2 =
			 * recImage2.substring(12);
			 * 
			 * String imagePath2 = "/yori/upload/" + imageName2;
			 * System.out.println(imagePath2);
			 */
		
			
			changeRecipeDTO.setRecNum(Integer.parseInt(request.getParameter("recNum")));
			changeRecipeDTO.setRecName(request.getParameter("recName"));
			changeRecipeDTO.setRecText(request.getParameter("recText"));
			changeRecipeDTO.setRecImage(request.getParameter("recImage"));
			changeRecipeDTO.setCateKind(request.getParameter("cateKind"));
			changeRecipeDTO.setCateHow(request.getParameter("cateHow"));
			changeRecipeDTO.setRecOrder(request.getParameter("recOrder"));
			
			int updateresult = recipeDAO.recipeUpdate(changeRecipeDTO);
			if(updateresult == 1) {
				response.getWriter().print("SUCCESS");
			}else
				response.getWriter().print("FAIL");
			break;
			
		case "delete":
			
			int deleteResult = recipeDAO.delete(request.getParameter("memId"), request.getParameter("recNum"));
			  
			if(deleteResult == 1) {
			    response.getWriter().print("SUCCESS");
			} else {
			    response.getWriter().print("FAIL");
			}
			break;
			
		case "search":
			String search = request.getParameter("search");
			ArrayList<RecipeDTO> searchList = recipeDAO.searchList(search);		
			request.setAttribute("recipeList", searchList);
			dispatch(request, response, "/recipeList.jsp");
			break;
		
			 			
		/*case "sendFile":		
			String uploadPath = request.getSession().getServletContext().getRealPath("upload");
			int size = 10 * 1024 * 1024;

			String fileName = "";

			try {
				// 占쏙옙占싹억옙占싸듸옙 占쏙옙 占쏙옙占싸듸옙 占쏙옙 占쏙옙占싹몌옙 占쏙옙占쏙옙占쏙옙
				MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
						new DefaultFileRenamePolicy());
				Enumeration files = multi.getFileNames();
				String file = (String) files.nextElement();
				fileName = multi.getFilesystemName(file);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

			String uploadPaths = "/yori/upload/" + fileName;
			JSONObject jobj = new JSONObject();
			jobj.put("url", uploadPaths);
			response.setContentType("application/json"); // 占쏙옙占쏙옙占쏙옙 타占쏙옙占쏙옙 json占쏙옙占쏙옙 占쏙옙占쏙옙占싹깍옙 占쏙옙占쏙옙 占쏙옙占쏙옙
			request.getSession().setAttribute("image", uploadPaths);
			response.getWriter().print(jobj.toJSONString());*/
			
			
		}
	}

	private void dispatch(HttpServletRequest request, HttpServletResponse response, String uri)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(uri);
		dispatcher.forward(request, response);
	}
}
