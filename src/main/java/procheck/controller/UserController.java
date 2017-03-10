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
import procheck.service.*;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private AcademyService academyService;
	
	@Autowired
	private RoleService roleService;

	@Autowired
	private MajorService majorService;
	@Autowired
	private GradeService gradeService;

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
		Map map=new HashMap<>();
		Map limp=new HashMap<>();
		if(user.getAcademy()!=null){
			Integer academyid=user.getAcademy().getId();
			map.put("rootacademy",academyService.findById(academyid));
			limp.put("rootacademylist",academyService.findAll());
			if(user.getMajor()!=null){
				Integer majorid=user.getMajor().getId();
				limp.put("majorlist",academyService.findById(academyid).getMajors());
				map.put("major",majorService.findByid(majorid));
				if(user.getGrade()!=null){
					Integer gradeid=user.getGrade().getId();
					limp.put("classlist",majorService.findByid(majorid).getGrades());
					map.put("classname",gradeService.findById(gradeid));
				}else{
					limp.put("classlist",gradeService.findByMajorId(majorid));
				}
			}else{
				limp.put("majorlist",academyService.findById(academyid).getMajors());
			}

		}else{
			limp.put("rootacademylist",academyService.findAll());
		}
		model.addAttribute("user",user);
		model.addAttribute("academymaplist",limp);
		model.addAttribute("academymap",map);
		return "/user/userprofile";
	}

	@PostMapping("/profile")
	public String profiled(String username,String chinesename,String email,String url,Integer academyId,Integer majorId,Integer classId,HttpServletResponse response){
		User user=userService.findUserByUsername(username);
		if(academyId!=null){
			user.setAcademy(academyService.findById(academyId));
		}else{
			user.setAcademy(null);
		}
		if(majorId!=null){
			user.setMajor(majorService.findByid(majorId));
		}else{
			user.setMajor(null);
		}

		if(classId!=null){
			user.setGrade(gradeService.findById(classId));
		}else{
			user.setGrade(null);
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

		userService.save(user);

		try {
			response.sendRedirect("/user/profile?name="+user.getUsername());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
