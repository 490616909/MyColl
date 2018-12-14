package great.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import great.entity.Page;
import great.entity.Transfer;

@Repository
public interface TransferMapper {

	// �ϴ���Ϣ���
	public boolean upload(Transfer transfer);

	// ��ҳ��ѯ
	public int findRecordCount(Transfer transfer);

	public Page findRecords(String num, Transfer transfer);

	public List<Transfer> findPageRecords(Transfer transfer);
	
//	//�߼���ҳ
//	public List<Transfer> queryall(RowBounds rb);
}
