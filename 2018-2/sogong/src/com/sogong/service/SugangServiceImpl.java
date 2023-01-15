package com.sogong.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sogong.domain.SugangVO;
import com.sogong.domain.UserVO;
import com.sogong.persistence.SugangDAO;

@Service
public class SugangServiceImpl implements SugangService {

	@Inject
	private SugangDAO sugangDAO;
	
	@Override
	public List<Map<String, Object>> list(UserVO userVO) {
		return sugangDAO.list(userVO);
	}
	
	@Override
	public void create(SugangVO sugangVO) {
		sugangDAO.create(sugangVO);
	}
	
	@Override
	public boolean check(String userID, String lessonID) {
		return sugangDAO.check(userID, lessonID);
	}
}
