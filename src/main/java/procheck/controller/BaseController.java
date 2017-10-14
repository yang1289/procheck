package procheck.controller;

import com.baidu.ueditor.ActionEnter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import procheck.common.config.SiteConfig;
import procheck.service.TaskService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

@RestController
@EnableConfigurationProperties(SiteConfig.class)
public class BaseController {

	@Autowired
	private SiteConfig siteConfig;
	
	@GetMapping("/controller")
	public String getUeditorController(HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setHeader("Content-Type" , "text/html");
		String rootPath = siteConfig.getUploadPath();
		File root=new File(rootPath);
		if(!root.exists()){
			root.mkdirs();
		}
		System.out.println("rootPath======"+rootPath);
	 	return new ActionEnter( request, rootPath ).exec() ;

	}

	@PostMapping("/controller")
	public String postUeditorController(HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setHeader("Content-Type" , "text/html");

		String rootPath = siteConfig.getUploadPath();
		System.out.println("rootPath======"+rootPath);
		return new ActionEnter( request, rootPath ).exec() ;

	}
	
//	@GetMapping("/all-tasks")
//	public String allTasks(){
//		return taskService.findAll().toString();
//	}
}
