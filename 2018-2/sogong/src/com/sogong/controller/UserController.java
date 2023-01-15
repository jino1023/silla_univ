package com.sogong.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sogong.domain.UserVO;
import com.sogong.service.SugangService;
import com.sogong.service.UserService;

@Controller
@RequestMapping(value = "/user/*")
public class UserController {
	
	@Inject
	private UserService userService;
	@Inject
	private SugangService sugangService;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinGET(HttpSession session) {
		UserVO userVO = (UserVO) session.getAttribute("loginUser");
		
		if (userVO == null) {
			return "/user/join";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ResponseEntity<String> joinPOST(UserVO userVO) {
		ResponseEntity<String> entity = null;
		
		try {
			userService.create(userVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/checkID", method = RequestMethod.POST)
	public ResponseEntity<String> checkID(@RequestParam String id) {
		ResponseEntity<String> entity = null;
		
		if (userService.checkID(id)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpSession session, Model model) {
		UserVO userVO = (UserVO) session.getAttribute("loginUser");
		if (userVO != null && userVO.getId().equals("admin")) {
			model.addAttribute("userList", userService.list());
			return "/user/list";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> delete(@RequestParam String id) {
		ResponseEntity<String> entity = null;
		
		try {
			userService.delete(id);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void info(HttpSession session) {
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<String> update(HttpSession session, UserVO userVO) {
		ResponseEntity<String> entity = null;

		try {
			userService.update(userVO);
			session.setAttribute("loginUser", userVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/sugang", method = RequestMethod.GET)
	public void sugang(HttpSession session, Model model) {
		UserVO userVO = (UserVO) session.getAttribute("loginUser");
		model.addAttribute("sugangList", sugangService.list(userVO));
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<String> login(HttpSession session, @RequestParam String id, @RequestParam String password) {
		ResponseEntity<String> entity = null;
		
		UserVO userVO = userService.login(id, password);
		
		if (userVO != null) {
			session.setAttribute("loginUser", userVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("loginUser");
		return "redirect:" + request.getHeader("Referer");
	}
	
}
