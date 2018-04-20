package procheck.dao;



import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.QueryByExampleExecutor;
import org.springframework.transaction.event.TransactionalEventListener;
import procheck.model.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User,Integer> {
	
	User findByUsername(String username);
	User findById(int id);


}
