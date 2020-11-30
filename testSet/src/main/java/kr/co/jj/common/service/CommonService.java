package kr.co.jj.common.service;

import java.util.List;
import java.util.Map;

import kr.co.jj.common.vo.AddrVO;
import kr.co.jj.company.vo.AddrDTO;

public interface CommonService {
	
	public Map<String, Object> getJobList() throws Exception;
	
	public Map<String, Object> getWorkFlagList();
	
	public int selectJobNo(String jobNm) throws Exception;
	
	public List<AddrVO> selectSdList() throws Exception;
	
	public List<AddrVO> selectSgList(AddrDTO dto) throws Exception;
	
	public List<AddrVO> selectDnList(AddrDTO dto) throws Exception;
}
