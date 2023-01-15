package com.yori.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yori.domain.RecipeDTO;


public class RecipeDAO {

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public ArrayList<RecipeDTO> list() {
		ArrayList<RecipeDTO> recipeList = new ArrayList<RecipeDTO>();
		
		Connection conn = DatabaseConnection.getInstance().getConnection();
		String SQL = "SELECT recNum, recName, recText, recImage, cateKind, cateHow, recOrder FROM recipe";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RecipeDTO recipeDTO = new RecipeDTO();
				recipeDTO.setRecNum(rs.getInt("recNum"));
				recipeDTO.setRecName(rs.getString("recName"));
				recipeDTO.setRecText(rs.getString("recText"));
				recipeDTO.setRecImage(rs.getString("recImage"));
				recipeDTO.setCateKind(rs.getString("cateKind"));
				recipeDTO.setCateHow(rs.getString("cateHow"));
				recipeDTO.setRecOrder(rs.getString("recOrder"));
				
				recipeList.add(recipeDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return recipeList;
	}
	

	
	public int insert(RecipeDTO dto) {

	      Connection conn = DatabaseConnection.getInstance().getConnection();
	      String sql = "INSERT INTO yori.recipe(recName,recText,recImage,cateKind, cateHow,recOrder,memId) VALUES (?,?,?,?,?,?,?)";
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getRecName());
	         pstmt.setString(2, dto.getRecText());
	         pstmt.setString(3, dto.getRecImage());
	         pstmt.setString(4, dto.getCateKind());
	         pstmt.setString(5, dto.getCateHow());
	         pstmt.setString(6, dto.getRecOrder());
	         pstmt.setString(7, dto.getMemId());
	         
	         return pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return 0;
	}
	   
	public int delete(String memId, String recNum) {
	      
	      Connection conn = DatabaseConnection.getInstance().getConnection();
	      String sql = "DELETE FROM yori.recipe where memId = ? and recNum  = ?";
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, memId);
	         pstmt.setString(2, recNum);
	         return pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return 0;
	}


	   
	public RecipeDTO detail(int num){
		RecipeDTO dto = null;
		Connection conn = DatabaseConnection.getInstance().getConnection();
		String SQL = "SELECT * from recipe where recNum=?";
		
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new RecipeDTO();
				dto.setRecNum(rs.getInt("recNum"));
				dto.setRecName(rs.getString("recName"));
				dto.setRecText(rs.getString("recText"));
				dto.setRecImage(rs.getString("recImage"));
				dto.setCateKind(rs.getString("cateKind"));
				dto.setCateHow(rs.getString("cateHow"));
				dto.setRecOrder(rs.getString("recOrder"));
				dto.setMemId(rs.getString("memId"));
			}	
		}catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}
	
	public int recipeUpdate(RecipeDTO dto) {
		Connection conn = DatabaseConnection.getInstance().getConnection();
		String SQL = "update recipe set recName=?, recText=?, recOrder=? where recNum=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, dto.getRecName());
			pstmt.setString(2, dto.getRecText());
			//pstmt.setString(3, dto.getRecImage());
			pstmt.setString(3, dto.getRecOrder());
			pstmt.setInt(4, dto.getRecNum());
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	
	public ArrayList<RecipeDTO> searchList(String recName) {
		ArrayList<RecipeDTO> searchList = new ArrayList<RecipeDTO>();
		
		Connection conn = DatabaseConnection.getInstance().getConnection();
		String SQL = "SELECT recNum, recName, recText, recImage, cateKind, cateHow, recOrder FROM recipe where recName like ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + recName + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RecipeDTO recipeDTO = new RecipeDTO();
				recipeDTO.setRecNum(rs.getInt("recNum"));
				recipeDTO.setRecName(rs.getString("recName"));
				recipeDTO.setRecText(rs.getString("recText"));
				recipeDTO.setRecImage(rs.getString("recImage"));
				recipeDTO.setCateKind(rs.getString("cateKind"));
				recipeDTO.setCateHow(rs.getString("cateHow"));
				recipeDTO.setRecOrder(rs.getString("recOrder"));
				
				searchList.add(recipeDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(searchList);
		return searchList;
	}
	
	public ArrayList<RecipeDTO> Populmenu(){
		ArrayList<RecipeDTO> populmenu = new ArrayList<RecipeDTO>();
		
		Connection conn = DatabaseConnection.getInstance().getConnection();
		String SQL = "SELECT recNum, b.recImage ,avg(rpStar) from reply a join recipe b using(recNum) group by recNum, b.recImage order by avg(rpStar) desc limit 3";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				RecipeDTO recipeDTO = new RecipeDTO();
				recipeDTO.setRecNum(rs.getInt("recNum"));
				recipeDTO.setRecImage(rs.getString("recImage"));
				
				populmenu.add(recipeDTO);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return populmenu;
	}
}
