package com.sogong.service;

import java.util.List;

import com.sogong.domain.UserVO;

public interface UserService {
	public void create(UserVO userVO);
	public List<UserVO> list();
	public void update(UserVO userVO);
	public void delete(String id);
	public boolean checkID(String id);
	public UserVO login(String id, String password);
}
