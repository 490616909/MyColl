package great.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import great.entity.Page;
import great.entity.Transfer;

@Repository
public interface TransferMapper {

	// 上传信息添加
	public boolean upload(Transfer transfer);

	// 分页查询
	public int findRecordCount(Transfer transfer);

	public Page findRecords(String num, Transfer transfer);

	public List<Transfer> findPageRecords(Transfer transfer);
	
//	//逻辑分页
//	public List<Transfer> queryall(RowBounds rb);
}
