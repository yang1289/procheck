package procheck.dao;

import org.springframework.data.jpa.repository.JpaRepository;


import procheck.model.Task;

public interface TaskRepository extends JpaRepository<Task, Integer>{

	

}
