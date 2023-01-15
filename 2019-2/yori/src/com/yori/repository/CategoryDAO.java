package com.yori.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yori.domain.CategorykDTO;
import com.yori.domain.CategoryhDTO;

public class CategoryDAO {

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public ArrayList<CategorykDTO> kindlist() {
		ArrayList<CategorykDTO> cateKindList = new ArrayList<CategorykDTO>();
		
		Connection conn = DatabaseConnection.getInstance().getConnection();
		String SQL = "SELECT cateKId, cateKName FROM categorykind";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CategorykDTO kindDTO = new CategorykDTO();
				kindDTO.setCateKindId(rs.getString("cateKId"));
				kindDTO.setCateKindName(rs.getString("cateKName"));

				cateKindList.add(kindDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cateKindList;
	}

	public ArrayList<CategoryhDTO> howlist() {
		ArrayList<CategoryhDTO> cateHowList = new ArrayList<CategoryhDTO>();
		
		Connection conn = DatabaseConnection.getInstance().getConnection();
		String SQL = "SELECT cateHId, cateHName FROM categoryhow";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CategoryhDTO howDTO = new CategoryhDTO();
				howDTO.setCateHowId(rs.getString("cateHId"));
				howDTO.setCateHowName(rs.getString("cateHName"));
				
				cateHowList.add(howDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cateHowList;
	}
	
}
