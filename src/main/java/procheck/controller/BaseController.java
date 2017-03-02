package procheck.controller;

import com.baidu.ueditor.ActionEnter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import procheck.service.TaskService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
public class BaseController {

	
	@GetMapping("/controller")
	public String getUeditorController(HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setHeader("Content-Type" , "text/html");
		String rootPath = ClassUtils.getDefaultClassLoader().getResource("").getPath();
		rootPath=rootPath.substring(rootPath.indexOf("/")+1);
		System.out.print("rootPath======"+rootPath);
	 	return new ActionEnter( request, rootPath ).exec() ;

	}

	@PostMapping("/controller")
	public String postUeditorController(HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setHeader("Content-Type" , "text/html");
		String rootPath = ClassUtils.getDefaultClassLoader().getResource("").getPath();
		rootPath=rootPath.substring(rootPath.indexOf("/")+1);
		System.out.print("rootPath======"+rootPath);
		return new ActionEnter( request, rootPath ).exec() ;

	}
	
//	@GetMapping("/all-tasks")
//	public String allTasks(){
//		return taskService.findAll().toString();
//	}
}
