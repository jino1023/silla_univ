package com.sogong.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sogong.domain.LessonVO;

@Repository
public class LessonDAOImpl implements LessonDAO {
	@Inject
	private SqlSession session;
	private static String NAMESPACE = "com.sogong.mapper.LessonMapper";
	
	@Override
	public Map<String, Object> read(int id) {
		return session.selectOne(NAMESPACE + ".read", id);
	}

	@Override
	public void create(LessonVO lessonVO) {
		session.insert(NAMESPACE + ".create", lessonVO);
	}
	
	@Override
	public List<Map<String, Object>> list(String type, String keyword, String contact) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("type", type);
		paramMap.put("keyword", keyword);
		paramMap.put("contact", contact);
		return session.selectList(NAMESPACE + ".list", paramMap);
	}
}
