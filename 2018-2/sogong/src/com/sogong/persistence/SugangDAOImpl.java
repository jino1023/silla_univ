package com.sogong.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sogong.domain.SugangVO;
import com.sogong.domain.UserVO;

@Repository
public class SugangDAOImpl implements SugangDAO {
	
	@Inject
	private SqlSession session;
	private static String NAMESPACE = "com.sogong.mapper.SugangMapper";
	
	@Override
	public List<Map<String, Object>> list(UserVO userVO) {
		return session.selectList(NAMESPACE + ".list", userVO);
	}
	
	@Override
	public void create(SugangVO sugangVO) {
		session.insert(NAMESPACE + ".create", sugangVO);
	}
	
	@Override
	public boolean check(String userID, String lessonID) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userID", userID);
		paramMap.put("lessonID", lessonID);
		int result = session.selectOne(NAMESPACE + ".check", paramMap);
		return result == 1;
	}
}
