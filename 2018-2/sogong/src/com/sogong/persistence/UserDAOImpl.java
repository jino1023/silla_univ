package com.sogong.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sogong.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Inject
	private SqlSession session;
	private static String NAMESPACE = "com.sogong.mapper.UserMapper";
	
	@Override
	public void create(UserVO userVO) {
		session.insert(NAMESPACE + ".create", userVO);
	}
	
	@Override
	public List<UserVO> list() {
		return session.selectList(NAMESPACE + ".list");
	}
	
	@Override
	public void update(UserVO userVO) {
		session.update(NAMESPACE + ".update", userVO);
	}
	
	@Override
	public void updatePoint(String id, int point) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("point", point);
		session.update(NAMESPACE + ".updatePoint", paramMap);
	}
	
	@Override
	public void delete(String id) {
		session.update(NAMESPACE + ".delete", id);
	}
	
	@Override
	public boolean checkID(String id) {
		int result = session.selectOne(NAMESPACE + ".checkID", id);
		return result == 0;
	}
	
	@Override
	public UserVO login(String id, String password) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("password", password);
		return session.selectOne(NAMESPACE + ".login", paramMap);
	}
}
