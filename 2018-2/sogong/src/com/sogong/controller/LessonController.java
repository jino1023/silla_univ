package com.sogong.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sogong.domain.LessonVO;
import com.sogong.domain.UserVO;
import com.sogong.service.LessonService;
import com.sogong.service.SugangService;

@Controller
@RequestMapping(value = "/lesson/*")
public class LessonController {

	@Inject
	private LessonService lessonService;
	@Inject
	private SugangService sugangService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@RequestParam(required=false) String type, @RequestParam(required=false) String keyword, @RequestParam(required=false) String contact, Model model) {
		model.addAttribute("lessonList", lessonService.list(type, keyword, contact));
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void register(HttpSession session) {
		
	}
	
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public void read(int id, Model model, HttpSession session) {
		model.addAttribute("lesson", lessonService.read(id));

		UserVO userVO = (UserVO) session.getAttribute("loginUser");
		if (userVO != null) {
			model.addAttribute("sugang", sugangService.check(userVO.getId(), String.valueOf(id)));
		}
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<String> register(String subject, String price, HttpSession session) {
		ResponseEntity<String> entity = null;
		
		try {
			UserVO userVO = (UserVO) session.getAttribute("loginUser");
			LessonVO lessonVO = new LessonVO();
			lessonVO.setSubject(subject);
			lessonVO.setPrice(Integer.parseInt(price));
			lessonVO.setTeacher(userVO.getId());
			lessonService.create(lessonVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}