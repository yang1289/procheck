package procheck.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import procheck.JsonModel.UserData;
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

//		List<User> users=userService.findAll();
//		model.addAttribute("users",users);
//
		List<Role> roles=roleService.findAll();
		model.addAttribute("roles",roles);
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

	@GetMapping("/data")
	@ResponseBody
	public String getUserData(Integer roleid){
		List<UserData> userDatas=new ArrayList<>();
		DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		int i=1;
		if(roleid!=null){
			Role role=roleService.findById(roleid);
			Set<User> users=role.getUsers();
			List<String> rolename=new ArrayList<>();
			rolename.add(role.getDescription());
			UserData userdata;
			for(User user:users){
				userdata=new UserData();
				userdata.setNo(i++);
				userdata.setUsername(user.getUsername());
				userdata.setChineseName(user.getChineseName());
				userdata.setOperateId(user.getId());
				userdata.setEmail(user.getEmail());
				userdata.setRolename(rolename);
				userdata.setRegistTime(dateFormat.format(user.getRegistTime()));
				if(user.getAcademy()!=null){
					userdata.setAcademy(user.getAcademy().getName());
				}else{
					userdata.setAcademy("无");
				}
				userDatas.add(userdata);
			}
		}else{
			List<User> users=userService.findAll();
			for(User user:users) {
				List<String> rolenames=new ArrayList<>();
				UserData userData=new UserData();
				userData.setNo(i++);
				userData.setUsername(user.getUsername());
				Set<Role> roles=user.getRoles();
				for(Role role:roles){
					rolenames.add(role.getDescription());
				}
				userData.setChineseName(user.getChineseName());
				userData.setRolename(rolenames);
				userData.setEmail(user.getEmail());
				userData.setRegistTime(dateFormat.format(user.getRegistTime()));
				if(user.getAcademy()!=null){
					userData.setAcademy(user.getAcademy().getName());
				}else{
					userData.setAcademy("无");
				}
				userData.setOperateId(user.getId());
				userDatas.add(userData);
			}
		}
		//变成json格式
		Gson gson=new Gson();
		String json=gson.toJson(userDatas);
		return json;
	}
	
}
