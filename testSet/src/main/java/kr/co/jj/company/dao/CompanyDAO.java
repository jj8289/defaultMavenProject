package kr.co.jj.company.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.jj.common.vo.AddrVO;
import kr.co.jj.company.vo.AddrDTO;
import kr.co.jj.company.vo.CompanyVO;


@Repository
public interface CompanyDAO {
	
	public List<AddrVO> selectSdList() throws Exception;
	
	public List<AddrVO> selectSgList(AddrDTO dto) throws Exception;
	
	public List<AddrVO> selectDnList(AddrDTO dto) throws Exception;
	
	/**
	 * 아이디 중복 체크
	 */
	public int selectCompanyCountByManagerId(CompanyVO vo) throws Exception;
	
	/**
	 * 유저 체크
	 */
	public int selectCompany(CompanyVO vo) throws Exception;

	public CompanyVO selectCompanyByManagerId(CompanyVO vo) throws Exception;
}
