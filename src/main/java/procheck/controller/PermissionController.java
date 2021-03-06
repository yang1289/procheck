package procheck.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;

import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import procheck.model.Permission;
import procheck.service.PermissionService;

@Controller
@RequestMapping("/permission")
public class PermissionController {

	private final static Logger logger=  LogManager.getLogger(PermissionController.class);
	@Autowired
	private PermissionService permissionService;

	@GetMapping("/list")
	public String AllPermission(Model model) {

		List<Permission> permissions = permissionService.findAll();
		model.addAttribute("allpermissions", permissions);
		return "/permission/list";

	}

	@GetMapping("/add")
	public String addingPermission(Model model) {

		List<Permission> permissions = permissionService.findByPid(0);
		model.addAttribute("prePermissions", permissions);
		return "/permission/permissionAdd";
	}

	@PostMapping("/add")
	public String addedPermission(String description, String name, boolean isParent,Integer prePermission, String url,
			HttpServletResponse response) {

		Permission permission = new Permission();
		permission.setDescription(description);
		permission.setName(name);

		
		if (isParent) {
			permission.setPid(0);
			
		}else{
			permission.setPid(prePermission);
			permission.setUrl(url);
		}
		permissionService.save(permission);
		try {
			response.sendRedirect("/permission/list");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@GetMapping("/edit")
	public String editingPermission(@RequestParam int id, Model model){
		model.addAttribute("editpermission",permissionService.findById(id));
		model.addAttribute("prePermissions",permissionService.findByPid(0));
		return "/permission/permissionEdit";
	}
	@PostMapping("/edit")
	public String editedPermission(@RequestParam int id,String description,String name,boolean isParent,Integer prePermission,String url,HttpServletResponse response){

		Permission permission=permissionService.findById(id);
		permission.setDescription(description);
		permission.setName(name);
		if(!isParent){
			permission.setPid(prePermission);
			permission.setUrl(url);
		}

		permissionService.save(permission);


		try {
			response.sendRedirect("/permission/list");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/delete")
	public String deleteById(@RequestParam int id,HttpServletResponse response){

		Permission permission=permissionService.findById(id);
		permissionService.delete(permission);
		
		try {
			response.sendRedirect("/permission/list");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
