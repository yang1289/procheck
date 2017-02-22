package procheck.service;

import java.util.ArrayList;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import procheck.dao.TaskRepository;
import procheck.model.Task;


@Service
@Transactional
public class TaskService {
	
	private final TaskRepository taskRespository;

	public TaskService(TaskRepository taskRespository) {
		
		this.taskRespository = taskRespository;
	}
	
	public List<Task> findAll(){
		List<Task> tasks=new ArrayList<>();
		for(Task task :  taskRespository.findAll()){
			tasks.add(task);
		}
		return tasks;
	}
	
	public Task findTask(int id){
		return taskRespository.findOne(id);
	}
	
	public void delete(int id){
		taskRespository.delete(id);
	}
	
	public void save(Task task){
		
		taskRespository.save(task);
	}
	
	
}
