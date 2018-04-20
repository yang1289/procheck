package procheck.controller;

import java.io.*;
import java.net.URLEncoder;
import java.nio.Buffer;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import procheck.common.config.MysqlConfig;
import procheck.model.Task;
import procheck.service.TaskService;
import procheck.util.BackUpSql;

@Controller
@EnableConfigurationProperties(MysqlConfig.class)
public class mainController {
	@Autowired
	private TaskService taskService;
	@Autowired
	private static MysqlConfig mysqlConfig;
	
//	@GetMapping("/index")
//	 public String home(HttpServletRequest request){
//		request.setAttribute("tasks", taskService.findAll());
//		request.setAttribute("mode", "MODE_HOME");
//		return "/index";
//
//	 }
	
	@GetMapping("/all-tasks")
	 public String alltasks(HttpServletRequest request){
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASK");
		return "/index";	 
	 }
	
	@GetMapping("/new-task")
	 public String newtasks(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "index";
		 
	 }
	
	@PostMapping("/save-task")
	 public String savetasks(@ModelAttribute Task task,BindingResult bindingResult,HttpServletRequest request){
		task.setDataCreated(new Date());
		System.out.println(task.getName());
		taskService.save(task);
		
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASK");
		return "index";
		 
	 }
	
	@GetMapping("/update-task")
	 public String updateTask(@RequestParam int id,HttpServletRequest request){
		request.setAttribute("task", taskService.findTask(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "index";
		 
	 }
	
	@GetMapping("/delete-task")
	 public String deleteTask(@RequestParam int id,HttpServletRequest request){
		taskService.delete(id);
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASK");
		return "index";
	 }

	 @GetMapping("/backup")
	 @ResponseBody
	public String sqlbackup(){
		 BackUpSql backUpSql=new BackUpSql();

		 backUpSql.backUp(mysqlConfig.getUrl(),mysqlConfig.getUsername(),mysqlConfig.getPassword(),mysqlConfig.getBackupPath());
		 return "hello";
	 }
	 @GetMapping("finsql")
	 @ResponseBody
	public String findsql(){
		File sql=new File(mysqlConfig.getBackupPath());
		 List<String> list=new ArrayList<>();
		 list.add("<ul>");
		if(sql.exists()){
			File[] flist=sql.listFiles();
			for(File f:flist){
				list.add("<li><a href='/getfile?filename="+f.getName()+"'>"+f.getName()+"</a></li>");
			}
		}
		list.add("</ul>");
		return list.toString();
	 }

	@GetMapping("getfile")
	@ResponseBody
	public void getfile(@RequestParam String filename, HttpServletRequest request, HttpServletResponse response) {
		File sql = new File(mysqlConfig.getBackupPath());
		File file = null;
		List<String> list = new ArrayList<>();
		if (sql.exists()) {
			File[] flist = sql.listFiles();
			for (File f : flist) {
				if (f.getName().equals(filename)) {
					file = f;
				}
			}
		}
		String fileName=file.getName();

		try {
			response.setHeader("content-type", "application/octet-stream");
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename="+ URLEncoder.encode(fileName,"utf-8"));
			OutputStream out=response.getOutputStream();
			FileInputStream filein=new FileInputStream(file);
			byte[] buffer=new byte[1024];
			int len=0;
			while((len=filein.read(buffer))>0){
				out.write(buffer,0,len);
			}
			out.close();
			filein.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}catch (IOException e){
			e.printStackTrace();
		}


	}
	
}
