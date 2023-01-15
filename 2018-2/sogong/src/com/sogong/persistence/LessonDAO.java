package com.sogong.persistence;

import java.util.List;
import java.util.Map;

import com.sogong.domain.LessonVO;

public interface LessonDAO {
	public Map<String, Object> read(int id);
	public void create(LessonVO lessonVO);
	public List<Map<String, Object>> list(String type, String keyword, String contact);
}
