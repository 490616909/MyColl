package great.mapper;

import org.springframework.stereotype.Repository;

import great.entity.User;
@Repository
public interface UserMapper {

	// ע��
	public int register(User user);

	// ��¼
	public User login(User user);

	// �����û���
	public User namecheck(User user);
	
	//��������
	public int reset(User user);
}
