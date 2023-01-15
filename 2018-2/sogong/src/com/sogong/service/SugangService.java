package com.sogong.service;

import java.util.List;
import java.util.Map;

import com.sogong.domain.SugangVO;
import com.sogong.domain.UserVO;

public interface SugangService {
	public List<Map<String, Object>> list(UserVO userVO);
	public void create(SugangVO sugangVO);
	public boolean check(String userID, String lessonID);
}
