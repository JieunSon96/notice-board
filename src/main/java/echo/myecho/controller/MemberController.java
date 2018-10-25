package echo.myecho.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import echo.myecho.dto.MemberDTO;
import echo.myecho.interfaces.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(MemberDTO dto,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("id: "+dto.getUser_id()+" pw: "+dto.getPassword());
		String loginCheck=this.service.isMember(dto);
		if(dto.getPassword().equals(loginCheck)) {
			System.out.println("correct! login Success!");
			session.setAttribute("user_id", dto.getUser_id());
			
			mav.addObject("user_id", session.getAttribute("user_id"));
			mav.setViewName("member/main");
			return mav;
		}else {
			
			System.out.println("incorrect");
			mav.setViewName("member/login");
			mav.addObject("incorrect","incorrect" );
			return mav;
		}
		
		
	}
	
	
	@RequestMapping("signUp.do")
	public void signUp(HttpServletRequest request,MemberDTO dto,HttpServletResponse response) throws Exception {
		System.out.println("Sign up Controller");
		int signUp=this.service.signUp(dto);
		if(signUp>0) {
			System.out.println("Sign up Success!!");
			response.setCharacterEncoding("utf8");
			response.setContentType("application/json");
			new Gson().toJson("success", response.getWriter());
		}else {
			System.out.println("Sign up Fail!!");
		}
		
	}
	
	@RequestMapping("logOut.do")
	public ModelAndView logOut(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("user_id");
		mav.setViewName("member/login");
		return mav;

	
	}
	
	

}
