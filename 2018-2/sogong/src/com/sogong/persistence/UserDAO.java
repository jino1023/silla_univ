package com.sogong.persistence;

import java.util.List;

import com.sogong.domain.UserVO;

public interface UserDAO {
	public void create(UserVO userVO);
	public List<UserVO> list();
	public void update(UserVO userVO);
	public void updatePoint(String id, int point);
	public void delete(String id);
	public boolean checkID(String id);
	public UserVO login(String id, String password);
}
