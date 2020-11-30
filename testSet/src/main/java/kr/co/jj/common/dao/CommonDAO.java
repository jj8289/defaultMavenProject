package kr.co.jj.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.jj.common.vo.AddrVO;
import kr.co.jj.company.vo.AddrDTO;

@Repository
public interface CommonDAO {
	public int selectJobNo(String jobNm) throws Exception;
	
	public List<AddrVO> selectSdList() throws Exception;
	
	public List<AddrVO> selectSgList(AddrDTO dto) throws Exception;
	
	public List<AddrVO> selectDnList(AddrDTO dto) throws Exception;
}
