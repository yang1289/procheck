package procheck.dao;

import org.springframework.context.event.EventListener;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.transaction.event.TransactionalEventListener;
import procheck.model.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer>{
	
	User findByUsername(String username);


}
