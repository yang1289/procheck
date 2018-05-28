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

import procheck.model.Permission;
import procheck.model.Role;
import procheck.service.PermissionService;
import procheck.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	private PermissionService permissionService;
	
	@Autowired
	private RoleService roleService;
	
	@GetMapping("/list")
	public String listRole(Model model){
		
		List<Role> roles=roleService.findAll();
		model.addAttribute("roles",roles);
		return "/role/rolelist";
		
	}
	
	@GetMapping("/permission/edit")
	public String permissionEdit(@RequestParam int id,Model model){
		
		model.addAttribute("role",roleService.findById(id));
		model.addAttribute("list",permissionService.findAllBylevel());
		
		return "/role/roleEdit";
	}
	
	@PostMapping("/permission/edit")
	public String permissionEdited(@RequestParam int id,int[] permissionIds,String name,String description,HttpServletResponse response){
		
		Role role=roleService.findById(id);
		role.setName(name);
		role.setDescription(description);
		Set<Permission> permissions=new HashSet<>();
		if(permissionIds!=null){
			for(int i:permissionIds){
				Permission permission=permissionService.findById(i);
				if(permission.getPid()>0){
					if(!permissions.contains(permissionService.findById(permission.getPid()))){
						permissions.add(permissionService.findById(permission.getPid()));
					}

				}
				permissions.add(permission);
			}
		}
		role.setPermissions(permissions);
		roleService.save(role);
		
		 try {
			response.sendRedirect("/role/permission/edit?id="+id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return null;
		
		
	}
	
	@GetMapping("/delete")
	public String deleteRoleById(@RequestParam int id, HttpServletResponse response){
		
		roleService.deleteById(id);
		
		try {
			response.sendRedirect("/role/list");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
}
