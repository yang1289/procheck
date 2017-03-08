package procheck.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import procheck.model.Academy;
import procheck.model.Project;
import procheck.model.Role;
import procheck.model.User;
import procheck.service.AcademyService;
import procheck.service.RoleService;
import procheck.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private AcademyService academyService;
	
	@Autowired
	private RoleService roleService;

	@GetMapping("/list")
	public String findAllUser(Model model){
		
		List<User> users=userService.findAll();
		model.addAttribute("users",users);
		
		return "/user/userlist";
	}
	
	@GetMapping("/role/edit")
	public String roleEdit(@RequestParam int id,Model model){
		User user =userService.findById(id);
		List<Role> roles=roleService.findAll();
		
		model.addAttribute("user",user);
		model.addAttribute("roles", roles);

		return "/user/roleedit";
	}


	@PostMapping("/role/edit")
	public String roleEdited(@RequestParam int id,int roleId,HttpServletResponse response){
		
		User user=userService.findById(id);
		Role role=roleService.findById(roleId);
		Set<Role> roles=new HashSet<>();
		roles.add(role);
		user.setRoles(roles);
		
		userService.update(user);
		
		try {
			response.sendRedirect("/user/list");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	@GetMapping("/profile")
	public String profileing(@RequestParam String name,Model model){
		User user =userService.findUserByUsername(name);
		Academy academy=user.getAcademy();
		Map<String,Academy> map=new HashMap<>();
		Map<String,List<Academy>> limp=new HashMap<>();
		if(academy.getPid()>0){
			Academy preacademy=academyService.findById(academy.getPid());
			if(preacademy.getPid()>0){
				Academy rootAcademy=academyService.findById(preacademy.getPid());
				limp.put("classlist",academyService.findByPid(academy.getPid()));
				limp.put("majorlist",academyService.findByPid(preacademy.getPid()));
				limp.put("rootacademylist",academyService.findByPid(rootAcademy.getPid()));
				map.put("classname",academy);
				map.put("major",preacademy);
				map.put("rootacademy",rootAcademy);
			}else{
				limp.put("majorlist",academyService.findByPid(academy.getPid()));
				limp.put("rootacademylist",academyService.findByPid(preacademy.getPid()));
				map.put("major",academy);
				map.put("rootacademy",preacademy);
			}
		}else{
			limp.put("rootacademylist",academyService.findByPid(academy.getPid()));
			map.put("rootacademy",academy);
		}
		model.addAttribute("user",user);
		model.addAttribute("academymaplist",limp);
		model.addAttribute("academymap",map);
		return "/user/userprofile";
	}

	@PostMapping("/profile")
	public String profiled(String username,String chinesename,String email,String url,Integer academyId,Integer majorId,Integer classId,HttpServletResponse response){
		User user=userService.findUserByUsername(username);

		if(classId!=null){
			user.setAcademy(academyService.findById(classId));
		}else if(majorId!=null){
			user.setAcademy(academyService.findById(majorId));
		}else if(academyId!=null){
			user.setAcademy(academyService.findById(academyId));
		}
		if(chinesename!=null){
			user.setChineseName(chinesename);
		}
		if(email!=null){
			user.setEmail(email);
		}
		if(url!=null){
			user.setUrl(url);
		}
		System.out.println("chineseName:====="+user.getChineseName());
		System.out.println("academy_id:====="+user.getAcademy().getName());
		userService.save(user);

		try {
			response.sendRedirect("/user/profile?name="+user.getUsername());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
