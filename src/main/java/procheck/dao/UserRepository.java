package procheck.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import procheck.model.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	
	User findByUsername(String username);
}
