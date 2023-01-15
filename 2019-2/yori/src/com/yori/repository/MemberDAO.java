package com.yori.repository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yori.domain.MemberDTO;
import com.yori.domain.RecipeDTO;


public class MemberDAO {
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public MemberDTO login(String memId, String memPwd) {
		MemberDTO memberDTO = null;
		
		Connection conn = DatabaseConnection.getInstance().getConnection();
		String sql = "SELECT * FROM yori.member WHERE memId = ? AND memPwd = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			pstmt.setString(2, memPwd);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setMemGen(rs.getString("memGen"));
				memberDTO.setMemId(rs.getString("memId"));
				memberDTO.setMemName(rs.getString("memName"));
				memberDTO.setMemNum(rs.getString("memNum"));
				memberDTO.setMemPwd(rs.getString("memPwd"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberDTO;
	}
	
	public int signup(MemberDTO memberDTO) {
	      Connection conn = DatabaseConnection.getInstance().getConnection();
	      String sql = "INSERT INTO yori.member(memId, memPwd, memName, memGen, memNum) VALUES (?, ?, ?, ?, ?)";
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	                  
	         pstmt.setString(1, memberDTO.getMemId());
	         pstmt.setString(2, memberDTO.getMemPwd());
	         pstmt.setString(3, memberDTO.getMemName());
	         pstmt.setString(4, memberDTO.getMemGen());
	         pstmt.setString(5, memberDTO.getMemNum());
	         pstmt.executeUpdate();
	        	    
	         return 1;
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return 0;
	   }
	
	
	public MemberDTO getMember(String memId) {
		Connection conn = DatabaseConnection.getInstance().getConnection();
		String sql = "select * from yori.member where memId = ?";
		MemberDTO dto = null;
		
		try {
			conn = DatabaseConnection.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setMemId(rs.getString("memId"));
				dto.setMemPwd(rs.getString("memPwd"));
				dto.setMemName(rs.getString("memName"));
				dto.setMemGen(rs.getString("memGen"));
				dto.setMemNum(rs.getString("memNum"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return dto;
	}

	public int updateMember(MemberDTO memberDTO) {
		Connection conn = DatabaseConnection.getInstance().getConnection();
		String sql = "UPDATE yori.member SET memPwd=?, memName=?, memGen=?, memNum=? where memId=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getMemPwd());
			pstmt.setString(2, memberDTO.getMemName());
			pstmt.setString(3, memberDTO.getMemGen());
			pstmt.setString(4, memberDTO.getMemNum());
			pstmt.setString(5, memberDTO.getMemId());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 0;
	}
}

