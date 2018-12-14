package great.service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import great.entity.Page;
import great.entity.Transfer;
import great.mapper.TransferMapper;

@Service
public class TransferService{
	
	@Autowired
	private TransferMapper transfermapper;
	public boolean upload(Transfer transfer) {
		// TODO Auto-generated method stub
		boolean result=transfermapper.upload(transfer);
		return result;
	}

	public int findRecordCount(Transfer transfer) {
		// TODO Auto-generated method stub
		int totalRecordNum =transfermapper.findRecordCount(transfer);
		return totalRecordNum;
	}

	public Page findRecords(String num, Transfer transfer) {
		// TODO Auto-generated method stub
		int pageNum = 1;
		if(num!=null){
			pageNum = Integer.parseInt(num);
		}
		int totalRecordsNum = findRecordCount(transfer);
		Page page = new Page(pageNum, totalRecordsNum, 5);
		transfer.setStartIndex(page.getStartIndex());
		transfer.setEndIndex(page.getEndIndex());
		List<Transfer> records =transfermapper.findPageRecords(transfer);
		page.setRecords(records);
		page.setTotalRecordsNum(totalRecordsNum);
		return page;
	}

	public List<Transfer> findPageRecords(Transfer transfer) {
		// TODO Auto-generated method stub
		List<Transfer> transfers=transfermapper.findPageRecords(transfer);
		return transfers;
	}

}
