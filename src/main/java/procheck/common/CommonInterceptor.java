package procheck.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import procheck.model.User;
import procheck.service.PermissionService;
import procheck.service.UserService;

@Component
public class CommonInterceptor implements HandlerInterceptor{
	Logger log = LogManager.getLogger(CommonInterceptor.class);
	@Autowired
	private UserService userService;
	@Autowired
	private PermissionService permissionService;
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object hanler, ModelAndView modeAndView)
			throws Exception {
		System.out.println("执行CommonInterceptor");
		if(modeAndView!=null){
			ModelMap modeMap=modeAndView.getModelMap();
			Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
			boolean isAuthenticated = false;
			if(authentication!=null){
				isAuthenticated=true;
				Object o=authentication.getPrincipal();
				if(o instanceof UserDetails){
					String username=((UserDetails)o).getUsername();
					User user=userService.findUserByUsername(username);
					
					modeMap.addAttribute("_principal",((UserDetails)o).getUsername());
					modeMap.addAttribute("_roles",((UserDetails)o).getAuthorities());
					modeMap.addAttribute("permissions",permissionService.findChildByUserId(user.getId()));
				}
			}
		}
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		return true;
	}

}
