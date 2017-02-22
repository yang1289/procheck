package procheck.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import procheck.model.Role;
import procheck.model.User;
import procheck.service.RoleService;
import procheck.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
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
		
	
}
