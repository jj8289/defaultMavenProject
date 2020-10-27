package kr.co.jj.company.service;

import java.util.List;

import kr.co.jj.common.vo.AddrVO;
import kr.co.jj.company.vo.AddrDTO;
import kr.co.jj.company.vo.CompanyVO;

public interface CompanyService{
	
	public List<AddrVO> selectSdList() throws Exception;
	
	public List<AddrVO> selectSgList(AddrDTO dto) throws Exception;
	
	public List<AddrVO> selectDnList(AddrDTO dto) throws Exception;

	public int selectCompanyCountByManagerId(CompanyVO vo) throws Exception;

	public int selectCompany(CompanyVO vo) throws Exception;

	public CompanyVO selectCompanyByManagerId(CompanyVO vo) throws Exception;
	
	public void insertCompany(CompanyVO vo) throws Exception;
	
	public CompanyVO selectManager(CompanyVO vo) throws Exception;
}
