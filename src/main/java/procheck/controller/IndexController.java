package procheck.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import org.springframework.web.bind.annotation.ResponseBody;
import procheck.model.Project;
import procheck.model.Role;
import procheck.model.User;
import procheck.service.ProjectService;
import procheck.service.UserService;
import procheck.util.RoleCheck;

import javax.servlet.http.HttpServletResponse;

@Controller
public class IndexController {
	private static Logger logger=Logger.getLogger(IndexController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private ProjectService projectService;
	
	@GetMapping("/")
	public String login(HttpServletResponse response) {
		String username=SecurityContextHolder.getContext().getAuthentication().getName();
		logger.info("username:==="+username);
		if(username!="anonymousUser"){
			try {
				logger.info("kankan username;");
				response.sendRedirect("/index");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
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

	@GetMapping("/index")
	public String index(Model model,HttpServletResponse response){
		String username= SecurityContextHolder.getContext().getAuthentication().getName();
		User user=userService.findUserByUsername(username);
		Set<Role> roles=user.getRoles();
		RoleCheck roleCheck=new RoleCheck();
		Role role=new Role();
		for(Role r:roles){
			role=r;
		}
		logger.info("roles:"+roles.size());
		if(roles.size()==0){
			model.addAttribute("role","visitor");
		}else{
			if(roleCheck.isStudent(role.getName())){
				List<Project> projects=projectService.findByUserIdAndPublished(user.getId(),false);
				model.addAttribute("success",projectService.findByUserIdAndPublished(user.getId(),true).size());
				model.addAttribute("applying",projects.size());
				model.addAttribute("role",role.getName());
			}else if(roleCheck.isAdviser(role.getName())){
				//logger.info("acdemyName:"+user.getAcademy().getName());
				if(null==user.getAcademy()){
					logger.info("执行academy");
					return "forward:/user/profile?name="+user.getUsername();

				}else{
					List<Project> projects=projectService.findByAcademyIdAndAdviserIsCheck(user.getAcademy().getId(),false);
					model.addAttribute("check",projects.size());
					model.addAttribute("role",role.getName());
				}
			}else if(roleCheck.isFpgroup(role.getName())){
				//List<Project> projects=projectService.findByAcademyIdAndAdviserIsCheckAndAcademyIsCheck(user.getAcademy().getId(),true,false);
				model.addAttribute("check",0);
				model.addAttribute("role",role.getName());
			}else if(roleCheck.isCpgroup(role.getName())){
				List<Project> projects=projectService.findByAcademyIsCheckAndCollegeIsCheck(true,false);
				model.addAttribute("check",projects.size());
				model.addAttribute("role",role.getName());
			}else if(roleCheck.isDsoAdmin(role.getName())){
				List<Project> projects=projectService.findByAcademyIsCheckAndCollegeIsCheck(true,false);
				model.addAttribute("publish",projectService.findByAdviserIsCheckAndAcademyIsCheckAndCollegeIsCheckAndPublished(true,true,true,false).size());
				model.addAttribute("check",projects.size());
				model.addAttribute("role",role.getName());
			}
		}

		return "/index";
	}
}
