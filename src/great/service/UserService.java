package great.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import great.entity.User;
import great.mapper.UserMapper;

@Service
public class UserService{
	@Autowired
	private UserMapper usermapper;
	public boolean register(User user) {
		// TODO Auto-generated method stub
		int ret=usermapper.register(user);
		return ret>0;
	}

	public User login(User user) {
		// TODO Auto-generated method stub
		User users=usermapper.login(user);
		return users;
	}

	public boolean namecheck(User user) {
		// TODO Auto-generated method stub
		User users=usermapper.namecheck(user);
		return users==null;
	}
	
	public boolean reset(User user) {
		int ret =usermapper.reset(user);
		return ret>0;
	}

}
