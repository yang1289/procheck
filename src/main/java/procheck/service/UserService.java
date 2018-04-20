package procheck.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import procheck.dao.RoleRepository;
import procheck.dao.UserRepository;
import procheck.model.Role;
import procheck.model.User;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserRepository userDao;
	@Autowired
	private RoleRepository roleRepository;
	
	public User findUserByUsername(String username){
		User user=userDao.findByUsername(username);
		return user;
	}
	
	public void save(User user){
		userDao.save(user);
	}
	
	public User findById(int userId){
		return userDao.findById(userId);
	}

	public List<User> findAll() {
		// TODO Auto-generated method stub

		 return userDao.findAll();
	}
	
	public void update(User user){
		userDao.save(user);
	}

	public List<User> findAdviser(){
		Role role=roleRepository.findByName("adviser");
		Set<User> advisers=role.getUsers();
		List<User> listAdvisers=new ArrayList<>();
		for(User user:advisers){
			listAdvisers.add(user);
		}
		return listAdvisers;
	}
	public void saveAllUsers(List<User> users){
		List<User> dataUsers=this.findAll();
		List<User> saveUsers=new ArrayList<>();
		for(User user:users){
			if(!dataUsers.contains(user)){
				saveUsers.add(user);
			}
		}
		if(saveUsers.size()>0){
			userDao.saveAll(saveUsers);
		}

	}
}
