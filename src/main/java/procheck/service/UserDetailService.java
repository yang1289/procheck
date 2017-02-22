package procheck.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import procheck.model.Permission;
import procheck.model.User;

@Service
public class UserDetailService implements UserDetailsService {

	Logger log = Logger.getLogger(UserDetailService.class);

	@Autowired
	private UserService userService;

	@Autowired
	private PermissionService permissionService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		User user = userService.findUserByUsername(username);
		if (user != null) {
			List<Permission> permissions = permissionService.findByUserId(user.getId());
			List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
			for (Permission permission : permissions) {
				GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(permission.getName());
				System.out.println("permission.name---"+permission.getName());
				grantedAuthorities.add(grantedAuthority);
			}
			return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),
					grantedAuthorities);
		} else {
			log.info("用户" + username + "不存在");
			throw new UsernameNotFoundException("用户名或密码不正确");
		}

	}

}
