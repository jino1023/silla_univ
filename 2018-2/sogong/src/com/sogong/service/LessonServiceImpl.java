package com.sogong.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sogong.domain.LessonVO;
import com.sogong.persistence.LessonDAO;

@Service
public class LessonServiceImpl implements LessonService {
	
	@Inject
	private LessonDAO lessonDAO;

	@Override
	public Map<String, Object> read(int id) {
		return lessonDAO.read(id);
	}
	
	@Override
	public void create(LessonVO lessonVO) {
		lessonDAO.create(lessonVO);
	}
	
	@Override
	public List<Map<String, Object>> list(String type, String keyword, String contact) {
		return lessonDAO.list(type, keyword, contact);
	}

}
