package com.sogong.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sogong.domain.UserVO;
import com.sogong.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO userDAO;
	
	@Override
	public void create(UserVO userVO) {
		userDAO.create(userVO);
	}
	
	@Override
	public List<UserVO> list() {
		return userDAO.list();
	}
	
	@Override
	public void update(UserVO userVO) {
		userDAO.update(userVO);
	}
	
	@Override
	public void delete(String id) {
		userDAO.delete(id);
	}
	
	@Override
	public boolean checkID(String id) {
		return userDAO.checkID(id);
	}
	
	@Transactional
	@Override
	public UserVO login(String id, String password) {
		userDAO.updatePoint(id, 10);
		return userDAO.login(id, password);
	}
}
