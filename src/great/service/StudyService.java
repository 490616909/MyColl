package great.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import great.entity.Study;
import great.mapper.StudyMapper;

@Service
//@Transactional
public class StudyService {
	@Autowired
	private StudyMapper studymapper;
	public List<Study> query() {
		// TODO Auto-generated method stub
		List<Study> study=studymapper.query();
		return study;
	}

}
