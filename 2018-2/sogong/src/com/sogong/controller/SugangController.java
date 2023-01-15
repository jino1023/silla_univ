package com.sogong.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sogong.domain.SugangVO;
import com.sogong.service.SugangService;

@Controller
@RequestMapping(value = "/sugang/*")
public class SugangController {
	
	@Inject
	private SugangService sugangService;
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<String> register(SugangVO sugangVO) {
		ResponseEntity<String> entity = null;
		
		try {
			sugangService.create(sugangVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
