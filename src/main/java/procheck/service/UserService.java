package procheck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import procheck.dao.UserRepository;
import procheck.model.User;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserRepository userDao;
	
	public User findUserByUsername(String username){
		User user=userDao.findByUsername(username);
		return user;
	}
	
	public void save(User user){
		userDao.save(user);
	}
	
	public User findById(int userId){
		return userDao.findOne(userId);
	}

	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userDao.findAll();
	}
	
	public void update(User user){
		userDao.save(user);
	}
}
