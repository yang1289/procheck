package procheck.controller;

import com.baidu.ueditor.ActionEnter;
import com.google.gson.Gson;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.*;

import procheck.common.config.SiteConfig;
import procheck.service.TaskService;
import procheck.util.ImagesModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@EnableConfigurationProperties(SiteConfig.class)
public class BaseController {

	//Logger log=Logger.getLogger(BaseController.class);
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
	@GetMapping("/deletepic")
	public Map deletePic(String images){
		//log.info("imgs.size"+imagesModel.getImages().length);
		Gson gson=new Gson();
		List<String> listImages;
		List<String> list=gson.fromJson(images,List.class);
		Map<String,String> reply=new HashMap<>();
		try {
			for(String url:list){
				String filePath=siteConfig.getUploadPath()+url.substring(1);
				File file=new File(filePath);
				if(file.exists()){
					file.delete();
				}
			}
			reply.put("status","success");
			reply.put("message","删除文件成功");
		}catch (Exception e){
			reply.put("status","error");
			reply.put("message","文件删除出现错误");
			e.printStackTrace();
		}

		return reply;
	}
	
//	@GetMapping("/all-tasks")
//	public String allTasks(){
//		return taskService.findAll().toString();
//	}
}
