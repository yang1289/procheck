package procheck.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import procheck.model.Task;
import procheck.service.TaskService;

@Controller
public class mainController {
	@Autowired
	private TaskService taskService;
	
	@GetMapping("/index")
	 public String home(HttpServletRequest request){
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_HOME");
		return "/index";
		 
	 }
	
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
	 
	
}
