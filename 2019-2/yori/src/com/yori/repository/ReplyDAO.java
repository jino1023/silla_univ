package com.yori.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yori.domain.RecipeDTO;
import com.yori.domain.ReplyDTO;

public class ReplyDAO {

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public int insert(ReplyDTO replyDTO) {

	      Connection conn = DatabaseConnection.getInstance().getConnection();
	      String sql = "INSERT INTO yori.reply(rpContent, memId, recNum, rpStar, rpDate) VALUES (?, ?, ?, ?, ?)";

	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, replyDTO.getRpContent());
	         pstmt.setString(2, replyDTO.getMemId());
	         pstmt.setInt(3, replyDTO.getRecNum());
	         pstmt.setInt(4, replyDTO.getRpStar());
	         pstmt.setString(5, replyDTO.getRpDate());
	         
	         return pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return 0;
	   }
	
	public ArrayList<ReplyDTO> list(int recNum) {
		ArrayList<ReplyDTO> replyList = new ArrayList<ReplyDTO>();
		
		Connection conn = DatabaseConnection.getInstance().getConnection();
		String SQL = "Select rpNum, rpContent, memId, rpDate, rpStar from reply where recNum=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, recNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyDTO replyDTO = new ReplyDTO();
				replyDTO.setRpNum(rs.getInt("rpNum"));
				replyDTO.setMemId(rs.getString("memId"));
				replyDTO.setRpContent(rs.getString("rpContent"));
				replyDTO.setRpDate(rs.getString("rpDate"));
				replyDTO.setRpStar(rs.getInt("rpStar"));
				
				replyList.add(replyDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return replyList;
	}
}
