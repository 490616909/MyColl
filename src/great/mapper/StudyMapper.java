package great.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import great.entity.Study;

@Repository
public interface StudyMapper {
	//����ѧ��
	
	public List<Study> query();
}
