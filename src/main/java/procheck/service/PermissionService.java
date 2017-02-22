package procheck.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import procheck.dao.PermissionDao;
import procheck.model.Permission;
import procheck.model.User;

@Service
@Transactional
public class PermissionService {

	@Autowired
	private UserService userService;
	
	@Autowired
	private PermissionDao permissionDao;

	public List<Permission> findByUserId(int userid) {
		User user = userService.findById(userid);
		List<Permission> permissions = new ArrayList<>();
		if (user.getRoles().size() > 0) {
			user.getRoles().stream().filter(role -> role.getPermissions().size() > 0).forEach(role -> {
				permissions.addAll(role.getPermissions().stream().filter(permission -> permission.getPid() > 0)
						.collect(Collectors.toList()));
			});
		}
		return permissions;

	}
	
	public List<Permission> findByPidGreaterThan(int pid){
		return permissionDao.findByPidGreaterThan(pid);
	}
	
	public List<Permission> findAll(){
		return permissionDao.findAll();
	}
	
	public List<Permission> findChildPermission() {
		// TODO Auto-generated method stub
		
		return permissionDao.findByPidGreaterThan(0);
	}
	
	public List findAllBylevel(){
		
		List list=new ArrayList();
		Map map;
		List<Permission> permissions=permissionDao.findByPid(0);
		for(Permission permission: permissions){
			map=new HashMap();
			map.put("permission", permission);
			map.put("childPermissions", permissionDao.findByPid(permission.getId()));
			list.add(map);
		}
		return list;
		
	}
	
	public Permission findById(int id){
		return permissionDao.findOne(id);
	}
	
	public List<Permission> findByPid(int pid){
		return permissionDao.findByPid(pid);
	}
	
	public void save(Permission permission){
		permissionDao.save(permission);
	}
	
	public void deleteById(int id){
		permissionDao.delete(id);
	}

}
