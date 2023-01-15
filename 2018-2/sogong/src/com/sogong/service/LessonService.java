package com.sogong.service;

import java.util.List;
import java.util.Map;

import com.sogong.domain.LessonVO;
import com.sogong.domain.UserVO;

public interface LessonService {
	public Map<String, Object> read(int id);
	public void create(LessonVO lessonVO);
	public List<Map<String, Object>> list(String type, String keyword, String contact);
}
