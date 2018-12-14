package great.mapper;

import org.springframework.stereotype.Repository;

import great.entity.User;
@Repository
public interface UserMapper {

	// 注册
	public int register(User user);

	// 登录
	public User login(User user);

	// 检验用户名
	public User namecheck(User user);
	
	//重置密码
	public int reset(User user);
}
