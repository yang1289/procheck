package procheck.controller;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import procheck.model.User;
import procheck.service.UserService;

@Controller
public class IndexController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String index() {	
		return "login";
	}
	
	@GetMapping("/regist")
	
	public String toRegister(){
		return "register";
	}
	
	@PostMapping("/regist")
	public String register(String username,String password,Model model){
		User user=userService.findUserByUsername(username);
		if(user!=null){
			model.addAttribute("message", "该用户已经被注册");
		}else if(StringUtils.isEmpty(username)){
			model.addAttribute("message", "用户名不能为空");
		}else if(StringUtils.isEmpty(password)){
			model.addAttribute("message", "密码不能为空");
		}else {
			Date date=new Date();
			password=new BCryptPasswordEncoder().encode(password);
			user=new User(username,password,date);
			userService.save(user);
			model.addAttribute("message","注册成功");
		}
		return "register";
	}
}
